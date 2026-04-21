#!/usr/bin/env bash
# repo-hygiene-local.sh — Mac-native nightly repo hygiene.
#
# Runs from a launchd agent (see ~/Library/LaunchAgents/com.calipfleger.repo-hygiene.plist)
# at 2:03 AM local time every day. Because it runs as a native Mac process
# (not through the Cowork sandbox / Virtualization.framework), it has
# full, unrestricted access to .git/ — no EPERM, no stale locks from VM
# handle contention.
#
# What it does:
#   1. Self-heals stale .git/index.lock older than 5 minutes.
#   2. Sweeps junk files (stray `-`, root *.tex, rendered presentations/*.html).
#   3. Runs the pre-commit hook manually to catch broken commits early.
#   4. Stages tracked modifications + pipeline-generated new files.
#   5. Commits with an auto-generated summary message.
#   6. Pushes to origin/main with a 60-second timeout.
#   7. Appends a log entry to shared-brain/documents/repo-hygiene-local-log.md.
#
# Safe to re-run any time (idempotent). If there's nothing to commit,
# it logs "working tree clean" and exits.

set -eu

REPO="$HOME/Documents/Claude/Projects/Cladue/shared-brain/projects/dissertation"
# Write to the SAME log the morning-digest loop reads — this is the canonical
# repo-hygiene log, regardless of whether hygiene runs from sandbox-Claude or
# Mac-native launchd. Keeping one log path means the digest Just Works.
LOG="$HOME/Documents/Claude/Projects/Cladue/shared-brain/documents/repo-hygiene-log.md"
TS="$(date '+%Y-%m-%d %H:%M')"

cd "$REPO" || { echo "repo not found: $REPO" >&2; exit 1; }

# --- helper: append a block to the log ---
log_block() {
    {
        echo ""
        echo "## [repo-hygiene-local $TS]"
        echo "$@"
    } >> "$LOG"
}

# --- 1. Self-heal stale locks (>5 min old) ---
# The sandbox-side pipeline can leave THREE different lock files when its
# Phase-5 push hits EPERM on the mount:
#   .git/index.lock                    — from `git add`/`git commit`
#   .git/HEAD.lock                     — from ref updates
#   .git/objects/maintenance.lock      — from gc / repack
# All three need clearing; if any is recent (<5 min), we assume a live git
# process owns it and abort this run rather than race.
lock_paths=(".git/index.lock" ".git/HEAD.lock" ".git/objects/maintenance.lock")
cleared=()
live_lock=""
for lock in "${lock_paths[@]}"; do
    [ -f "$lock" ] || continue
    lock_age_min=$(( ( $(date +%s) - $(stat -f %m "$lock") ) / 60 ))
    if [ "$lock_age_min" -gt 5 ]; then
        rm -f "$lock"
        cleared+=("$(basename "$lock") (${lock_age_min} min old)")
    else
        live_lock="$lock (${lock_age_min} min old)"
        break
    fi
done
if [ -n "$live_lock" ]; then
    log_block "⚠ live lock found: $live_lock — aborting this run"
    exit 0
fi
if [ ${#cleared[@]} -gt 0 ]; then
    lock_msg="✓ cleared ${#cleared[@]} stale lock(s): ${cleared[*]}"
else
    lock_msg="· no locks to clear"
fi

# --- 2. Junk sweep ---
swept=""
if [ -e -- - ]; then
    rm -f -- -
    swept="$swept\n  - removed stray '-' file"
fi
for f in *.tex; do
    [ -e "$f" ] || continue
    rm -f "$f"
    swept="$swept\n  - removed root $f"
done
for f in chapter-*/presentations/*.html; do
    [ -e "$f" ] || continue
    # `git rm --cached` if tracked, else just rm
    git rm --cached -- "$f" 2>/dev/null || true
    rm -f "$f"
    swept="$swept\n  - removed rendered $f"
done
rm -rf _book/ .quarto/ _freeze/ 2>/dev/null || true

# --- 3. Check if there's anything to commit ---
if [ -z "$(git status --porcelain)" ]; then
    log_block "$lock_msg"$'\n'"✓ working tree clean — nothing to commit"
    exit 0
fi

# --- 4. Run pre-commit hook manually to catch bad commits early ---
if [ -x scripts/pre-commit-hook.sh ]; then
    if ! bash scripts/pre-commit-hook.sh > /tmp/pre-commit-out.txt 2>&1; then
        log_block "$lock_msg"$'\n'"✗ pre-commit hook failed — aborting, see /tmp/pre-commit-out.txt"$'\n'"$(cat /tmp/pre-commit-out.txt | tail -10)"
        exit 0
    fi
fi

# --- 5. Stage tracked modifications + pipeline-generated new files ---
git add -u 2>/dev/null || true
git add chapter-*/literature/bibliography.bib 2>/dev/null || true
git add chapter-*/literature/literature-review.md 2>/dev/null || true
git add chapter-*/code/stats.json 2>/dev/null || true
git add chapter-*/figures/ 2>/dev/null || true

# --- 6. Commit if anything was actually staged ---
if [ -z "$(git diff --cached --name-only)" ]; then
    log_block "$lock_msg"$'\n'"✓ nothing staged after sweep — no commit needed"
    exit 0
fi

n_staged=$(git diff --cached --name-only | wc -l | tr -d ' ')
dirs=$(git diff --cached --name-only | awk -F/ '{print $1}' | sort -u | paste -sd, - | tr -d ' ')
msg="repo-hygiene: auto-commit $n_staged file(s) across $dirs"

if ! git commit -m "$msg" > /tmp/commit-out.txt 2>&1; then
    log_block "$lock_msg"$'\n'"✗ commit failed — see /tmp/commit-out.txt"$'\n'"$(tail -5 /tmp/commit-out.txt)"
    exit 0
fi

short_sha=$(git rev-parse --short HEAD)

# --- 7. Push (with timeout fallback, since macOS doesn't ship `timeout`) ---
# macOS default has no /usr/bin/timeout (that's GNU coreutils).  If you've
# installed coreutils via Homebrew, `gtimeout` is available.  Otherwise we
# fall through to plain `git push` — if push hangs (rare), you'll see the
# agent idle in `launchctl list` and can `launchctl stop` it manually.
push_result="⚠ push skipped"
if git remote get-url origin >/dev/null 2>&1; then
    if command -v gtimeout >/dev/null 2>&1; then
        git_push_cmd=(gtimeout 60 git push origin main)
    elif command -v timeout >/dev/null 2>&1; then
        git_push_cmd=(timeout 60 git push origin main)
    else
        git_push_cmd=(git push origin main)
    fi
    if "${git_push_cmd[@]}" > /tmp/push-out.txt 2>&1; then
        push_result="✓ pushed $short_sha to origin/main"
    else
        push_result="✗ push failed — see /tmp/push-out.txt: $(tail -1 /tmp/push-out.txt)"
    fi
fi

# --- 8. Log ---
log_block "$lock_msg"$'\n'"swept:$swept"$'\n'"✓ committed $short_sha ($n_staged files in $dirs)"$'\n'"$push_result"
