# Weekly literature review — 2026-09-09

## Result: no scan ran. The search tool was absent, not the results.

**0 queries executed · 0 candidates · 0 new citations · 0 fabricated.**

`semanticSearch` — the tool Phase 4 depends on and the only citation source the pipeline spec permits — is not present in this session's toolset. Two separate tool searches, one by topic and one requiring the word "search" in the tool name, returned only calendar search, web search, Google Drive file search and Blender documentation search. There is no paper-search capability of any kind available tonight.

**Nothing was substituted.** WebSearch could have surfaced plausible-looking papers, but the pipeline forbids citing anything `semanticSearch` did not return, for the good reason that a `[@bibkey]` inserted from an unverified source is worse than a missing one — it looks identical to a checked citation in the rendered chapter. Zero insertions is the correct output here, not a degraded one.

## Why this is not the same as the last two runs' "0 new citations"

The 09-03 and 09-07 runs also ended with zero new citations, and it would be easy to file tonight as a third consecutive data point. It is not, and the distinction matters for the decision C is being asked to make:

| Run | Queries run | Candidates | Outcome | What it tells us |
|---|---|---|---|---|
| 2026-09-03 | yes | 2 | both already filed | Empty **result set** |
| 2026-09-07 | yes | 3 | all 3 already filed | Empty **result set** |
| 2026-09-09 | **no** | — | tool unavailable | Empty **capability** |

The 100%-duplicate finding across 09-03 and 09-07 (5 of 5 candidates already in the bibliography, across four chapters) is real evidence that the standing queries have been exhausted and need rewriting. **Tonight adds nothing to that case and should not be counted toward it.** The duplicate rate remains 5/5 over two runs, not 5/5 over three.

## What would have run

The queries are in place and unchanged; only the tool to execute them was missing. Weighted as in recent runs toward the two thinnest bibliographies:

- **Ch4 — biogeochem / GEOFISH (25 keys, thinnest).** Oxygen-minimum-zone extent and pelagic fish distribution; ocean-acidification hotspots and population-level responses in harvested stocks.
- **Ch1 — ILME / PWC (30 keys).** Walker Circulation strengthening vs. weakening under anthropogenic forcing; precipitation δ¹⁸O as a circulation-regime fingerprint in isotope-enabled GCMs; CESM LME tropical Pacific SST–SLP covariability under combined forcing.
- **Ch3 — California volcanic–ENSO (43 keys).** California winter precipitation and atmospheric-river response to tropical eruptions; corroborating coral δ¹⁸O after El Chichón and Pinatubo; tree-ring and speleothem drought–ENSO teleconnections.

## Bibliography state (unchanged tonight)

| Chapter | Keys |
|---|---|
| Ch1 — ILME / PWC | 30 |
| Ch2 — volcanic ENSO | 39 |
| Ch3 — California volcanic ENSO | 43 |
| Ch4 — biogeochem / GEOFISH | **25** |
| Ch5 — climate-tech sentiment | 37 |

Total 174, matching the last audit. The carried structural finding is untouched: **32 of those 174 keys are never cited in their chapter's prose** — roughly one in five. Phase 4 may write to `bibliography.bib` but is barred from editing `chapterN.qmd`, so collection has no coupled consumption step and the gap widens by design every time a scan succeeds. That is a policy decision for C, not something more scanning will fix — and tonight, for once, the gap did not grow.

## Recommendation

If `semanticSearch` is missing on the next run too, this is a durable environment change rather than a blip, and Phase 4 should be treated as suspended rather than silently reporting zeroes each night — the same failure shape as `stats-autorecompute`'s ten no-ops. One more run will tell.
