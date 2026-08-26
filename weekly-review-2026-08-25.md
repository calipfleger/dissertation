# Weekly literature review — 2026-08-25

Previous review: 2026-08-18 (7-day gap).

## Tooling status

`semanticSearch` remains unavailable — roughly 51 days since the outage began around 2026-07-05. A ToolSearch for a dedicated paper-search tool again returned only WebSearch, calendar search, Drive search and Blender documentation search.

This run followed the 2026-08-18 precedent rather than the more permissive 2026-08-10 one: WebSearch was substituted, but under three constraints. Every candidate had to be verified field-by-field against an institutional or publisher record before being written anywhere. Verified references go to `bibliography.bib` and `literature-review.md` **only** — nothing was appended to any `chapterN.qmd`, since chapter prose stays reserved for the tool the pipeline spec actually names. And no BibTeX field was recorded that a landing page did not confirm.

**The 08-10 vs 08-11 policy discrepancy is still unreconciled — this is the seventh consecutive run acting on a provisional interpretation. C should settle it.**

## Queries run

Four searches, concentrated on Chapter 4, which was the only chapter with substantive work in the 08-19 → 08-25 window:

1. Stratospheric aerosol injection and ocean biogeochemistry / nutrients / productivity in Earth system models, 2024–2025
2. Marine cloud brightening and ocean ecosystem response, nutrients and chlorophyll, 2025
3. N* nitrogen-excess tracer, nitrate–phosphate, Pacific denitrification and nitrogen fixation
4. Gruber & Sarmiento 1997 bibliographic verification

## Added — 1 reference

**Gruber, N., & Sarmiento, J. L. (1997).** Global patterns of marine nitrogen fixation and denitrification. *Global Biogeochemical Cycles*, 11(2), 235–266. [10.1029/97GB00077](https://doi.org/10.1029/97GB00077) → **Chapter 4**, bibkey `gruber1997nstar`.

This is the paper that defines N* itself, and it was pulled deliberately rather than opportunistically: the Ch4 maps notebook gained standalone N* surface maps on 2026-08-25 (N* ≈ [NO₃⁻] − 16 × [PO₄³⁻]), and that diagnostic had no citation behind it. Gruber and Sarmiento propose N* as a quasi-conservative tracer built from a linear combination of nitrate and phosphate about the 16:1 Redfield ratio, then map it globally from GEOSECS and Atlantic cruise data. The regional structure is directly on-point for Chapter 4 — N* below about −3 µmol kg⁻¹ across the eastern tropical North and South Pacific, tracking water-column denitrification in the oxygen minimum zones.

**Note on the date rule:** this is a pre-2020 reference, against the scan's usual 2020+ preference. It is included because it is a *methods* citation for a quantity the code now computes, not a claim about the current state of the field — the tracer's defining source cannot be replaced by a recent paper. Flagging the deviation rather than burying it.

Verification: the Wiley landing page returned empty (as it did on 08-18), so the entry was confirmed against Princeton's institutional record, which carries the publisher DOI, journal, volume, issue, page range, ISSN and both author names, together with the abstract.

## Left uncited — 1 candidate

**Zhao et al. (2024).** Carbon Cycle Response to Stratospheric Aerosol Injection With Multiple Temperature Stabilization Targets and Strategies. *Earth's Future*. DOI `10.1029/2024EF004474`.

Topically well matched to Chapter 4 — CESM2(WACCM6-MA) under SSP2-4.5, the same scenario family GEOFISH runs in. But `agupubs.onlinelibrary.wiley.com` again returned an empty response, so the author list, volume and article number could not be confirmed from the publisher, and nothing was fabricated to fill the gap. **This is the second consecutive run in which Wiley/AGU pages have blocked verification** — worth noting as a systematic gap rather than a one-off, since a large share of the relevant SAI literature sits behind AGU. DOI recorded here for C or a later run.

## Notes

Chapters 1, 2, 3 and 5 had no substantive work in this window and no queries were run against them. Their coverage was last refreshed on 2026-08-18 (Ch2 and Ch3 each gained the CoralHydro2k entry) and 2026-08-10.
