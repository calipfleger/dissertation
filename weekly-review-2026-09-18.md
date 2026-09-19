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

---

# Addendum — second pipeline run of 2026-09-18 (23:32)

The 01:02 run of this date covered the 2026-09-10 → 2026-09-17 outage window. This run covers 2026-09-18 itself. Phase 4 result is unchanged and the reason is unchanged.

## Phase 4 — 0 queries, 0 candidates, 0 new citations, 0 fabricated

`semanticSearch` is **absent from the session toolset for the fourth consecutive run**. Confirmed by two independent tool searches: one topical (paper / literature / academic keywords), one requiring the literal token `search` in the tool name. Between them they return WebSearch, Drive `search_files`, Calendar `search_events`, Gmail `search_threads`, Blender `search_api_docs` / `search_manual_docs`, Desktop Commander `start_search` / `get_more_search_results`, and the MCP registry. **No paper-search capability of any kind.**

Nothing was substituted. The spec forbids citing a source `semanticSearch` did not return, and the 2026-09-03 test settled that WebSearch cannot stand in on a recency-filtered scan — it ranks by authority, the queries ask for 2020–present, so it returns the canonical papers that are already filed.

Bibliography unchanged, counted directly from the `.bib` files:

| Chapter | Keys |
|---|---|
| Ch1 ilme-pwc | 30 |
| Ch2 volc-enso | 39 |
| Ch3 california-volc-enso | 43 |
| Ch4 biogeochem-geofish | 25 |
| Ch5 climate-tech-sentiment | 37 |
| **Total** | **174** |

## The evidence ledger, restated so it does not drift

Four zero-citation runs in a row is easy to read as four data points for "the standing queries are exhausted." It is not. The two categories have to stay separate:

| Run | Queries executed | Category |
|---|---|---|
| 2026-09-03 | yes | empty result set — all candidates already filed |
| 2026-09-07 | yes | empty result set — all candidates already filed |
| 2026-09-09 | **no** | empty capability — `semanticSearch` absent |
| 2026-09-18 (01:02) | **no** | empty capability |
| 2026-09-18 (23:32) | **no** | empty capability |

The query-exhaustion case still rests on **5 of 5 duplicates across two runs**, and has not grown since 09-07. The capability gap is a separate, larger problem: Phase 4 has not executed a single query in fifteen days.

## What this costs, by chapter

Ch4 (25 keys) and Ch1 (30 keys) carry the thinnest bibliographies and are the two chapters Phase 4 weights most heavily. Both have now gone three scheduled scans without one query running. Ch4 is the sharper loss — its entire analytical output is still synthetic pending the Derecho run, so literature is the only axis on which it could have moved at all this fortnight, and it did not.

## Recommendation, unchanged and now overdue

A literature API — Semantic Scholar or OpenAlex, both free — is the only option that restores intended behaviour, and it would close the Crossref gap in `context/literature-verification.md` at the same time. This has been the standing recommendation since 2026-09-03. Fifteen days of zero queries is the argument for acting on it.
