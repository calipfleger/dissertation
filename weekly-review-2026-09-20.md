# Weekly review — 2026-09-20

_Written by the nightly-pipeline run of 2026-09-20 (Phase 4). No human sessions today; eighth consecutive automation-only day._

## Phase 4 literature scan: not run, for the sixth consecutive time

**0 queries · 0 candidates · 0 new citations · 0 fabricated.**

`semanticSearch` — the only citation source this pipeline is permitted to use — is **absent from the session toolset**, confirmed again tonight by a tool search on paper / literature / citation keywords. The returned set is unchanged: `WebSearch`, Drive file search, calendar semantic search, Gmail thread search, Blender documentation search, Desktop Commander's file/content search. No paper-search tool of any kind.

Nothing was substituted. The spec forbids citing anything `semanticSearch` did not return, and the reason is worth restating: an unverified `[@bibkey]` renders identically to a checked one, so a fabricated citation is strictly worse than a gap.

### Ledger — keep the two failure modes separate

| Run | Queries | Candidates | New | Cause |
|---|---|---|---|---|
| 2026-09-03 | 5 | 5 | 0 | empty **result set** — all already filed |
| 2026-09-07 | 5 | 5 | 0 | empty **result set** — all already filed |
| 2026-09-09 | 0 | — | 0 | empty **capability** — tool absent |
| 2026-09-18 (run 1) | 0 | — | 0 | empty **capability** — tool absent |
| 2026-09-18 (run 2) | 0 | — | 0 | empty **capability** — tool absent |
| 2026-09-19 | 0 | — | 0 | empty **capability** — tool absent |
| **2026-09-20** | **0** | — | **0** | empty **capability** — tool absent |

The standing-query-exhaustion case rests only on the first two rows and is unchanged at **5/5 duplicates over two runs**. The five capability rows look like corroboration in a log skim and are nothing of the kind. Phase 4 has now executed zero queries for **17 days**. The 66 standing queries across the five `search-queries.md` files (Ch1 13 · Ch2 13 · Ch3 13 · Ch4 14 · Ch5 13) have not been exercised in that time.

---

## The "174 keys" figure counts 8 works twice — the dissertation cites 166

Every log for weeks has recorded the bibliography as **174 keys** (Ch1 30 · Ch2 39 · Ch3 43 · Ch4 25 · Ch5 37). That sum is correct and the per-chapter counts are correct. What it is *not* is a count of distinct references: **8 keys are defined in two chapters each**, so 174 `.bib` entries resolve to **166 unique works**.

| Key | Defined in | Entries identical? |
|---|---|---|
| `clement1996ocean` | Ch2, Ch3 | yes |
| `he2026volcaniccomparison` | Ch2, Ch3 | whitespace only |
| `konecky2020iso2k` | Ch1, Ch2 | yes |
| `oppo2026indopacific` | Ch1, Ch2 | yes |
| `robock2000volcanic` | Ch2, Ch3 | **no — see below** |
| `tiger2023tropical` | Ch2, Ch3 | whitespace only |
| `tripp2026galapagos` | Ch2, Ch3 | no (Ch2 carries an annotation `note` field Ch3 lacks) |
| `walter2023coralhydro2k` | Ch2, Ch3 | yes |

The overlap is exactly where you would expect it: seven of the eight are Ch2↔Ch3 (the two volcano-ENSO chapters), the eighth pair Ch1↔Ch2 on proxy-network references.

> **Correction, 2026-09-22:** the split above is wrong and was never measured. Counted key by key it is **six Ch2↔Ch3 and two Ch1↔Ch2** (`konecky2020iso2k` and `oppo2026indopacific` are both Ch1↔Ch2). The 174/166/139/27 totals in this file are correct and have since reproduced a third time; only the attribution was wrong. Left in place rather than rewritten, with this note — see `weekly-review-2026-09-21.md`.

**Nothing is broken by this.** `_quarto.yml` carries an explicit note that there is no book-level merged bibliography — each chapter resolves `literature/bibliography.bib` from its own YAML header and renders its own References section. So duplicate keys never collide at render time, and no chapter is at risk of resolving the wrong entry.

**One divergence is worth fixing anyway.** `robock2000volcanic` is not the same entry in the two files:

| Field | Ch2 | Ch3 |
|---|---|---|
| author | `Robock, Alan` | `Robock, A.` |
| number | `2` | *absent* |
| doi | `10.1029/1998RG000054` | *absent* |

Both render. But they render *differently*, so the same reference will appear in two forms in one dissertation's two reference lists — the kind of inconsistency a committee reader notices and the author does not, because the chapters are rarely read side by side. Ch2's entry is the complete one; the fix is to copy it over Ch3's. The other seven pairs are either byte-identical or differ only in an annotation field that `chicago-author-date.csl` does not print.

---

## Orphan citations: the 09-19 arithmetic is confirmed, and gains a fourth row

Last night resolved the 32-vs-18 discrepancy by showing that both counts were right under different definitions of "cited". **All three reproduce exactly again tonight**, computed independently:

| What counts as "cited" | Defined | Cited | Orphaned | Per chapter |
|---|---|---|---|---|
| `chapterN.qmd` only | 174 | 142 | **32** | Ch1 6 · Ch2 8 · Ch3 9 · Ch4 5 · Ch5 4 |
| `chapterN.qmd` + `presentations/chapterN-progress.qmd` | 174 | 156 | **18** | Ch1 5 · Ch2 5 · Ch3 5 · Ch4 2 · Ch5 1 |
| the above + `literature/literature-review.md` | 174 | 167 | 7 | Ch1 2 · Ch2 2 · Ch3 2 · Ch4 1 · Ch5 0 |
| **unique works, chapter prose only** | **166** | **139** | **27** | *(not separable per chapter)* |

The fourth row is new and follows from the duplicate finding above. All four are per-chapter sums of the same computation except the last, which de-duplicates first. **32 → 27 is a drop of exactly 5**, and the five are accounted for individually: `he2026volcaniccomparison`, `oppo2026indopacific`, `tripp2026galapagos` and `walter2023coralhydro2k` are each orphaned in *both* chapters that define them (counted twice, should be once), and `tiger2023tropical` is cited in Ch2 but orphaned in Ch3 (counted once as an orphan, but the work *is* cited in the dissertation). Nothing else moves.

**The recommendation from 09-19 stands and sharpens.** Headline **32** when the question is editorial — "how many entries are sitting in a chapter's `.bib` that its prose never uses", which is the per-chapter maintenance question and the one `check_citations.sh` mirrors. Headline **27** when the question is bibliographic — "how many works have I collected and never cited anywhere". Do not headline 18 or 7: 18 credits progress slides, which are not the dissertation, and 7 additionally credits `literature/literature-review.md`, which is where this pipeline deposits its own paragraphs, so that row lets the automation mark its own output as used.

The bibliography-drift decision C has been asked for is still C's. Its stated blocker was resolved last night; tonight the number it rests on is corrected as well.

---

## Counts

- **Bibliography:** 174 entries / **166 unique works** — Ch1 30 · Ch2 39 · Ch3 43 · Ch4 25 · Ch5 37, 8 keys defined twice.
- **Citations resolving:** `check_citations.sh` **156/156 PASS** (Ch1 25 · Ch2 34 · Ch3 38 · Ch4 23 · Ch5 36).
- **New this run:** 0 candidates, 0 citations, 0 fabricated, 0 flagged `⚠ relevance uncertain`.
