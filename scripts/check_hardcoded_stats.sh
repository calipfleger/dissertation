#!/usr/bin/env bash
# check_hardcoded_stats.sh — flag raw statistics written directly into chapter prose.
#
# Chapter prose must never carry a hardcoded p-value, correlation or sample size.
# A statistic in the text should either (a) cite the source paper's own value with
# [@bibkey], or (b) come from code/stats.json via an inline `{python}` chunk.
#
# WHY THIS SCRIPT EXISTS: the nightly pipeline's task file specifies the scan as
#     grep -rn -E '\b[pr] *[=<>] *0\.\d+' chapter-*/*.qmd
# but `\d` is a PCRE escape and has no meaning in POSIX ERE, which is what `grep -E`
# uses. That pattern silently matches nothing — it has been reporting "clean" since
# 2026-08-11 while a real hardcoded-stat line sat in chapter2.qmd the whole time.
# The fix is to write the digit class as [0-9]. Use this script instead of the
# inline grep.
#
# Usage:  ./scripts/check_hardcoded_stats.sh          (from the dissertation root)
# Exit:   0 = clean, 1 = suspect lines found

set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

# Each pattern below catches one shape of hardcoded statistic.
PATTERNS=(
  '\b[pr] *[=<>]+ *0\.[0-9]+'          # p = 0.03, r < 0.26, p<0.05
  '\bp *[=<>]+ *\.[0-9]+'              # p = .05  (leading dot)
  '\bn_?e?f?f? *[=≈] *[0-9]+'          # n = 120, n_eff ≈ 56
  '\br\^?2? *[=] *0\.[0-9]+'           # r2 = 0.41
)

# Collect hits once, then split them into two tiers so the output stays actionable.
#   FLAG   — a literal statistic on a line that does NOT pull from stats.json at all.
#   REVIEW — the line already uses a {python} chunk, so most of its numbers are
#            sourced correctly; any remaining literal is usually a methods
#            parameter (bootstrap resamples, ensemble size) and is fine.
hits=$(for pat in "${PATTERNS[@]}"; do
         grep -rn -E "$pat" chapter-*/*.qmd 2>/dev/null | grep -v '_TODO'
       done | sort -u)

flag=$(echo "$hits"   | grep -v '{python}' | sed '/^$/d')
review=$(echo "$hits" | grep    '{python}' | sed '/^$/d')

found=0
if [ -n "$flag" ]; then
  found=1
  echo "⚠ FLAG — literal statistics in prose with no stats.json reference on the line:"
  echo "  (each should cite [@bibkey] or read from code/stats.json via a {python} chunk)"
  echo
  echo "$flag" | cut -c1-200
  echo
fi

if [ -n "$review" ]; then
  echo "· REVIEW — $(echo "$review" | wc -l | tr -d ' ') line(s) already pull from stats.json"
  echo "  but still contain a literal number (usually a methods parameter — normally fine):"
  echo "$review" | cut -c1-140 | sed 's/^/    /'
  echo
fi

if [ "$found" -eq 0 ]; then
  echo "✓ no hardcoded statistics found in chapter prose."
  exit 0
fi

echo
echo "Found suspect line(s). Review each: a value quoted from a cited paper is fine"
echo "if it carries its [@bibkey]; a value derived from this study's own data is not."
exit 1
