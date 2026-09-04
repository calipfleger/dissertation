# Weekly literature review — 2026-09-03

**Result: 0 new citations across all five chapters — and for once that is a finding rather than a shortfall.**

## What was run

`semanticSearch` does not exist in this session (it has never existed in any run of this pipeline; the tool named in the task file is not among the available tools). WebSearch has been used as a provisional substitute for eleven runs, with the policy question carried as open blocker #7. This run tested the substitution directly instead of exercising it again.

Two representative queries were run, one per chapter, drawn verbatim from the chapters' own `search-queries.md`:

- **Ch2** — "Does the El Niño-like response to tropical volcanic eruptions depend on the pre-eruption ENSO state…"
- **Ch1** — "…whether the Pacific Walker Circulation has strengthened or weakened under late-20th-century and early-21st-century anthropogenic forcing?"

## What came back

**Every single returned paper was already in the relevant bibliography.**

- Ch2's top hit, *Tropical volcanic impacts on MENA climate via ENSO and NAO dynamics in a high-top model* (`10.1038/s41612-025-01201-x`), is already filed as `dogar2025mena`. The rest of the result set was Khodri et al. 2017, Predybaylo-lineage work, and Pausata-lineage work — the chapter's foundational citations.
- Ch1's results were *A very likely weakening of Pacific Walker Circulation…*, *Reconciling opposing Walker circulation trends…*, *Two Competing Drivers of the Recent Walker Circulation Trend*, and *Early emergence and determinants of human-induced Walker circulation weakening* — **all four already in `chapter-1-ilme-pwc/literature/bibliography.bib`**.

Dedupe by DOI therefore rejected 100% of results. Nothing was appended to any bib, any literature-review, or any chapter. No `AUTO` blocks were added by Phase 4 this run.

## The policy question this settles (open blocker #7)

**WebSearch is not a substitute for semanticSearch on this task, and the reason is structural rather than a matter of query tuning.** The chapters' `search-queries.md` files all specify a **2020–present** filter and ask for the recent frontier. WebSearch ranks by authority and link popularity, so it returns the *canonical* papers on a topic — which, after five months of this loop running, are exactly the papers already in the bibliographies. The two tools optimize for opposite ends of the same distribution: semanticSearch for recency-filtered recall, WebSearch for citation-weighted precision.

Evidence that the bibliographies are not thin and the loop is not under-collecting: Ch2 holds **17 entries dated 2025–2026** out of 39, Ch1 holds **7** out of 30. The frontier has been harvested. WebSearch cannot see past it.

**Recommendation for C — pick one, this should not carry to a 12th run:**

1. **Retire Phase 4's search step** and keep the scan as a periodic human task. Lowest effort, and honest about what the automation can do.
2. **Give the pipeline a real literature API.** A Semantic Scholar or OpenAlex MCP connector would restore the intended behaviour exactly; both have free public APIs and would also fix the Crossref-verification gap noted in `context/literature-verification.md`.
3. **Keep WebSearch but change the job** — from "find new papers" to "check whether anything already cited has been retracted, corrected, or superseded". That plays to what WebSearch is good at and would produce a genuinely useful signal instead of a null one.

Option 2 is the only one that delivers what the task file was written to do.

## Bibliography hygiene — a number worth C's attention

Counting keys defined in each chapter's `bibliography.bib` that are **never cited in that chapter's `chapterN.qmd`**:

| Chapter | Keys | Uncited in chapter |
|---|---|---|
| Ch1 | 30 | 6 |
| Ch2 | 39 | 8 |
| Ch3 | 43 | 9 |
| Ch4 | 25 | 5 |
| Ch5 | 37 | 4 |
| **Total** | **174** | **32** |

Nearly one entry in five is collected but unused. (The weekly verification audit reports 18 rather than 32 because it counts a key as used if it appears in *any* `.qmd`, including the progress decks; measured against chapter prose alone the gap is larger.) This is the structural consequence of Phase 4 being permitted to write into `bibliography.bib` and `literature-review.md` but barred from writing into `chapterN.qmd` — collection has no coupled consumption step. Tonight's zero-result scan at least did not make it worse.
