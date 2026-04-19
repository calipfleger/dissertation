# Verification checklist

Every chapter carries three categories of claim that need human sign-off before landing on the public site. This file is the **master index** — each chapter has its own detailed `VERIFY.md` inside its folder.

Status key:
- ✅ verified — human has read source, confirmed claim, signed date + initials
- ⏸ pending — not yet reviewed
- ❌ wrong — found a discrepancy; needs rework before re-publish

## Global policies

1. **Never hardcode a p-value, correlation, or sample size in chapter prose.**
   Compute in `code/compute_stats.py`, write to `code/stats.json`, interpolate via `{python}` chunks. A stat you see in a .qmd as a raw number is a bug.
2. **Every `[@bibkey]` requires source-doc confirmation.** Read the paper (at minimum the abstract + relevant findings section) before tagging the claim ✅.
3. **Auto-generated content is marked with `<!-- AUTO YYYY-MM-DD phase-N -->` comments.** Anything without a matching ✅ entry in this file stays tagged `⚠ preliminary` on the published site.
4. **Before committing: `./scripts/check_citations.sh`.** Pre-commit hook runs this. Unresolved `[@bibkey]` → block the commit.

## Per-chapter checklists

- [Ch1 — iLME PWC](chapter-1-ilme-pwc/VERIFY.md)
- [Ch2 — VOLC ENSO](chapter-2-volc-enso/VERIFY.md)
- [Ch3 — California-VOLC-ENSO](chapter-3-california-volc-enso/VERIFY.md)
- [Ch4 — Biogeochem & Geo Fish](chapter-4-biogeochem-geofish/VERIFY.md)
- [Ch5 — Climate Tech Sentiment](chapter-5-climate-tech-sentiment/VERIFY.md)

## Pre-submission audit

Before sending a chapter to your committee: open its `VERIFY.md` and confirm every item is ✅. Any ⏸ or ❌ is a blocker.
