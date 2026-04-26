#!/usr/bin/env bash
# check_citations.sh — fail if any [@bibkey] in a .qmd doesn't resolve to
# an entry in the chapter's bibliography.bib.
#
# Intended as a pre-commit hook AND a CI guard. Exits non-zero on any
# unresolved citation so git commit or CI fails loudly.
#
# Usage:
#   ./scripts/check_citations.sh              # check all chapters
#   ./scripts/check_citations.sh chapter-2    # one chapter
#
# Run from the dissertation repo root.

set -eu
# pipefail intentionally OFF — `grep` exits 1 on zero matches, which is a
# normal state for chapters with no citations yet (e.g. Ch4). Each pipeline
# below handles its own failures with `|| true` or `|| echo 0` as needed.
cd "$(dirname "$0")/.."

filter="${1:-}"
overall_missing=0
overall_checked=0

check_chapter() {
    local ch="$1"
    local bib="${ch}/literature/bibliography.bib"
    if [ ! -f "$bib" ]; then
        echo "· $ch — no bibliography.bib (skipping)"
        return 0
    fi

    # Extract all BibTeX keys in this chapter's .bib (tolerate zero matches)
    local available
    available=$( { grep -oE '^@\w+\{[A-Za-z0-9_]+' "$bib" 2>/dev/null || true; } \
        | sed 's/.*{//' | sort -u)

    # Extract every [@bibkey] cited in any .qmd for this chapter.
    # Use `|| true` so an empty result doesn't kill the pipeline under set -e.
    #
    # Pre-strip HTML comments so example/placeholder citations inside
    # `<!-- ... -->` blocks (e.g. boilerplate slideshow examples in
    # chapter1-slides.qmd) don't count as live and aren't flagged as missing.
    # The Python heredoc handles multi-line comments cleanly — bash regex
    # alone can't do non-greedy `.*?` matching across lines.
    local used
    used=$( {
        python3 - "$ch" <<'PY' 2>/dev/null || true
import re, sys, glob
ch = sys.argv[1]
files = glob.glob(f"{ch}/*.qmd") + glob.glob(f"{ch}/presentations/*.qmd")
for f in files:
    try:
        text = open(f).read()
    except OSError:
        continue
    # Strip HTML comments (single- and multi-line)
    text = re.sub(r'<!--.*?-->', '', text, flags=re.DOTALL)
    for m in re.finditer(r'@[A-Za-z0-9_]+', text):
        print(m.group(0))
PY
    } | grep -v '@ucsb\.edu\|@ucsb$' \
      | sed 's/@//' | sort -u)

    # Count safely: wc -l never fails; strip whitespace.
    local count_used
    count_used=$(printf '%s\n' "$used" | grep -c . 2>/dev/null || echo 0)
    count_used=${count_used//[[:space:]]/}

    if [ "$count_used" -eq 0 ]; then
        echo "· $ch — no [@bibkey] citations found in .qmd files"
        return 0
    fi

    # Only compare if we have both lists populated.
    local missing
    missing=$( { comm -23 <(printf '%s\n' "$used") <(printf '%s\n' "$available") 2>/dev/null || true; } \
        | grep -v '^$' || true)

    local count_missing
    count_missing=$(printf '%s\n' "$missing" | grep -c . 2>/dev/null || echo 0)
    count_missing=${count_missing//[[:space:]]/}

    overall_checked=$((overall_checked + count_used))

    if [ -n "$missing" ]; then
        echo "✗ $ch — $count_missing unresolved citation(s) of $count_used used:"
        printf '%s\n' "$missing" | sed 's/^/    @/'
        overall_missing=$((overall_missing + count_missing))
    else
        echo "✓ $ch — all $count_used citations resolve"
    fi
}

for ch in chapter-*/; do
    ch="${ch%/}"
    if [ -n "$filter" ] && [[ "$ch" != *"$filter"* ]]; then
        continue
    fi
    check_chapter "$ch"
done

echo ""
if [ "$overall_missing" -gt 0 ]; then
    echo "FAIL: $overall_missing unresolved citation(s) across $overall_checked checked."
    echo "Fix: either add the entry to the chapter's bibliography.bib, or remove the [@bibkey] from the .qmd."
    exit 1
else
    echo "PASS: $overall_checked citation(s) checked, all resolve."
fi
