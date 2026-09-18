# Weekly literature review — 2026-09-18

## Result: no scan ran, for the third consecutive time. The tool is still missing.

**0 queries executed · 0 candidates · 0 new citations · 0 fabricated.**

`semanticSearch` — the tool Phase 4 depends on and the only citation source the pipeline spec permits — is again not present in this session's toolset. Two independent tool searches were run tonight, one by topic and one requiring the literal token `search` in the tool name; between them they returned web search, calendar event search, Gmail thread search, Google Drive file search, Desktop Commander file/content search, Blender API and manual search, and the MCP registry search. **No paper-search capability of any kind.**

**Nothing was substituted, again.** WebSearch is sitting right there and would happily return plausible-looking climate papers. The spec forbids it for a good reason that is worth restating every time this happens: a `[@bibkey]` inserted from an unverified source renders *identically* to a checked one in the built chapter, so the cost of a wrong citation is not a visible gap but an invisible error in a dissertation. Zero insertions is the correct output, not a degraded one.

## This is now a standing capability gap, not a run of bad luck

Three consecutive scheduled runs — 2026-09-09, and both runs since — have found the tool absent. That is long enough to stop filing it as an anomaly per run and start treating it as a property of the environment. **It needs C's attention, because nothing inside the pipeline can fix it:** the pipeline cannot install a tool it does not have, and it will keep producing correct-but-empty Phase 4 output indefinitely.

## The exhaustion evidence has not grown — do not let these runs pad it

It would be easy to skim the logs, count five consecutive runs ending in "0 new citations", and conclude the standing queries are thoroughly exhausted. Three of those five runs never executed a query.

| Run | Queries run | Candidates | Outcome | What it tells us |
|---|---|---|---|---|
| 2026-09-03 | yes | 2 | both already filed | Empty **result set** |
| 2026-09-07 | yes | 3 | all 3 already filed | Empty **result set** |
| 2026-09-09 | **no** | — | tool unavailable | Empty **capability** |
| (run between) | **no** | — | tool unavailable | Empty **capability** |
| 2026-09-18 | **no** | — | tool unavailable | Empty **capability** |

The duplicate-rate finding stands where it stood on 09-07: **5 of 5 candidates already in the bibliography, across four chapters, over two runs.** That is still suggestive that the standing queries need rewriting, and it is still only two runs of evidence. Tonight adds nothing to it.

## What would have run

The queries in each chapter's `literature/search-queries.md` are in place and unchanged; only the tool to execute them was missing. Weighting is unchanged from recent runs — toward the two thinnest bibliographies, both of which have now gone three scheduled scans without a query firing:

- **Ch4 — biogeochem / GEOFISH (25 keys, thinnest).** Oxygen-minimum-zone extent and pelagic fish distribution; ocean-acidification hotspots and population-level responses in harvested stocks.
- **Ch1 — ILME / PWC (30 keys).** Walker Circulation strengthening vs. weakening under anthropogenic forcing; precipitation δ¹⁸O as a circulation-regime fingerprint in isotope-enabled GCMs; CESM LME tropical Pacific SST–SLP covariability under combined forcing.
- **Ch3 — California volcanic–ENSO (43 keys).** California winter precipitation and atmospheric-river response to tropical eruptions; corroborating coral δ¹⁸O after El Chichón and Pinatubo; tree-ring and speleothem drought–ENSO teleconnections.

## Bibliography state (unchanged tonight, and unchanged since 2026-09-09)

| Chapter | Keys |
|---|---|
| Ch1 — ILME / PWC | 30 |
| Ch2 — volcanic ENSO | 39 |
| Ch3 — California volcanic ENSO | 43 |
| Ch4 — biogeochem / GEOFISH | **25** |
| Ch5 — climate-tech sentiment | 37 |

Total 174 keys across five chapters. Counted directly from the `.bib` files tonight, not carried forward from the last review.
