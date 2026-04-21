#!/usr/bin/env bash
# pre-commit-hook.sh — run from .git/hooks/pre-commit (symlinked or copied).
#
# BLOCKS a commit if:
#   1. Any [@bibkey] cited in a .qmd doesn't resolve to the chapter's .bib.
#   2. Any *.qmd staged for commit contains a `_TODO:` marker that should be
#      resolved before publishing.
#
# WARNS but allows the commit if:
#   3. Any stats.json has `_warnings` — null computed stats will render as
#      `⚠TODO⚠` sentinels on the live site. This is a soft reminder that
#      compute_stats.py still has placeholder values; the commit proceeds.
#
# Install once:
#   ln -sf ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
#   chmod +x .git/hooks/pre-commit
#
# Bypass (emergency only):
#   git commit --no-verify ...

set -e
cd "$(git rev-parse --show-toplevel)"

echo "▸ pre-commit: verifying dissertation..."

# --- 1. Citation integrity --------------------------------------------------
if [ -x ./scripts/check_citations.sh ]; then
    if ! ./scripts/check_citations.sh; then
        echo ""
        echo "✗ pre-commit: citation check failed."
        echo "  Fix the unresolved citations or use 'git commit --no-verify' to bypass."
        exit 1
    fi
fi

# --- 2. TODO markers in staged .qmd files ----------------------------------
staged_qmds=$(git diff --cached --name-only --diff-filter=AM | grep '\.qmd$' || true)
if [ -n "$staged_qmds" ]; then
    todo_hits=$(echo "$staged_qmds" | xargs grep -n '_TODO:' 2>/dev/null || true)
    if [ -n "$todo_hits" ]; then
        echo ""
        echo "✗ pre-commit: staged .qmd files contain _TODO: markers:"
        echo "$todo_hits" | sed 's/^/    /'
        echo ""
        echo "  Resolve the TODOs or use 'git commit --no-verify' to bypass."
        exit 1
    fi
fi

# --- 3. stats.json warnings (unfilled computed stats) ----------------------
for stats_file in chapter-*/code/stats.json; do
    [ -f "$stats_file" ] || continue
    if grep -q '"_warnings"' "$stats_file"; then
        echo ""
        echo "⚠ pre-commit: $stats_file has _warnings (unfilled stats)."
        echo "  This is a soft warning — commit allowed, but the chapter has preliminary numbers."
        echo "  Run 'python3 code/compute_stats.py' after updating the analysis."
    fi
done

echo "✓ pre-commit: all checks passed"
