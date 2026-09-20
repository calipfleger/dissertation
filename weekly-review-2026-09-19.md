# Weekly review — 2026-09-19

_Written by the nightly-pipeline run of 2026-09-19 (Phase 4). No human sessions today; seventh consecutive automation-only day._

## Phase 4 literature scan: not run, for the fifth consecutive time

**0 queries · 0 candidates · 0 new citations · 0 fabricated.**

`semanticSearch` — the only citation source this pipeline is permitted to use — is **absent from the session toolset**. Confirmed tonight by two independent tool searches: one topical (paper / literature / scholarly / academic) and one requiring the literal token `search` in the tool name. Both returned the same set: `WebSearch`, Drive file search, calendar semantic search, Gmail thread search, Blender documentation search, Desktop Commander's file/content search, and the MCP registry. No paper-search tool of any kind.

Nothing was substituted. The spec forbids citing anything `semanticSearch` did not return, and the reason is worth restating: an unverified `[@bibkey]` renders identically to a checked one, so a fabricated citation is strictly worse than a gap.

### Ledger — keep the two failure modes separate

| Run | Queries | Candidates | New | Cause |
|---|---|---|---|---|
| 2026-09-03 | 5 | 5 | 0 | empty **result set** — all already filed |
| 2026-09-07 | 5 | 5 | 0 | empty **result set** — all already filed |
| 2026-09-09 | 0 | — | 0 | empty **capability** — tool absent |
| 2026-09-18 (run 1) | 0 | — | 0 | empty **capability** — tool absent |
| 2026-09-18 (run 2) | 0 | — | 0 | empty **capability** — tool absent |
| **2026-09-19** | **0** | — | **0** | empty **capability** — tool absent |

The standing-query-exhaustion case rests only on the first two rows and is unchanged at **5/5 duplicates over two runs**. The four capability rows look like corroboration in a log skim and are nothing of the kind. Phase 4 has now executed zero queries for **16 days**.

Bibliography unchanged, counted directly from the `.bib` files: **Ch1 30 · Ch2 39 · Ch3 43 · Ch4 25 · Ch5 37 = 174 keys.**

---

## RESOLVED: the orphan-citation discrepancy — both numbers were right

Since 2026-09-18 the logs have carried an unresolved contradiction between two automated passes eleven days apart:

- weekly-review **2026-09-07**: "32 of 174 keys never cited in their chapter's prose"
- verification-digest **2026-09-18**: "174 defined, 156 cited, **18 orphaned**"

Both agreed exactly on 174 defined, and nothing had been added to any `.bib` in between — so one of them looked wrong. **Neither is. They use different denominators for the word "prose",** and recomputing all three candidate definitions tonight reproduces both figures exactly:

| What counts as "cited" | Defined | Cited | Orphaned | Per chapter |
|---|---|---|---|---|
| `chapterN.qmd` only | 174 | 142 | **32** | Ch1 6 · Ch2 8 · Ch3 9 · Ch4 5 · Ch5 4 |
| `chapterN.qmd` + `presentations/chapterN-progress.qmd` | 174 | 156 | **18** | Ch1 5 · Ch2 5 · Ch3 5 · Ch4 2 · Ch5 1 |
| the above + `literature/literature-review.md` | 174 | 167 | 7 | Ch1 2 · Ch2 2 · Ch3 2 · Ch4 1 · Ch5 0 |

The 09-07 review counted row 1. The 09-18 digest counted row 2. Both are arithmetically correct.

**The 14-key gap between them is, in its entirety, citations that appear only in the progress decks** — which is the same six-week-old bug this run found in Phase 5e. Every nightly log since 2026-08-05 has asserted that `chapter*-progress.qmd` does not exist; those files not only exist, they are carrying 14 of the repository's citations on their own. Two findings that looked unrelated are one.

### Which number should the policy decision use

**32.** If the deliverable is the dissertation, a key cited only in a progress slide is not cited in the dissertation — it is defined in the bibliography of a chapter whose text never refers to it. Row 2 flatters the count by crediting presentation material, and row 3 flatters it further by crediting the literature-review scratch file, which is where Phase 1 and Phase 4 *deposit* new references in the first place. Counting row 3 would mean the pipeline's own accumulation marks its own work as used.

The three counts should be reported together rather than one of them chosen silently, since the gap between 32 and 7 is precisely a map of how far each reference has travelled from bibliography toward chapter text.

### The 18 orphans under the digest's own definition

- **Ch1 (5):** `bayr2020errors`, `fu2023bjerknes`, `liu2018pacific`, `oppo2026indopacific`, `watanabe2023two`
- **Ch2 (5):** `evans2026teak`, `liang2025iod`, `murray2025wpwp`, `oppo2026indopacific`, `walter2023coralhydro2k`
- **Ch3 (5):** `chen2021distinct`, `persad2020dependence`, `tiger2023tropical`, `torbenson2025disruption`, `walter2023coralhydro2k`
- **Ch4 (2):** `clarke2021etp`, `gruber1997nstar`
- **Ch5 (1):** `barbaglia2024lexicon`

Two keys (`oppo2026indopacific`, `walter2023coralhydro2k`) are defined in two chapters each and orphaned in both, which is why the repo-wide distinct-key count (166) is lower than the summed per-chapter count (174).

**This does not decide the bibliography-drift policy** — that is still C's call. It removes the reason to defer it.

---

## Standing asks, unchanged

1. **A Semantic Scholar or OpenAlex connector.** Sixteen days of dead literature scans. Ch4 (25 keys, thinnest) and Ch1 (30) are the chapters Phase 4 weights most heavily and the ones this costs most. The same connector would close the Crossref-verification gap recorded in `memory/context/literature-verification.md`.
2. **Why the Mac stops running the suite.** Two host outages in a fortnight (3.5 days, then 8), six days of uptime between them, two clean days since. Detection is solved; availability is not.
3. **The Ch2 seasonal-scaling figures.** ~4.5 months of superseded 2026-05-04 figures rendering against 2026-05-20 sources; 7 phantom refs breaking `quarto render`; 17 candidates staged and waiting on a decision that changes figures the prose was written against.
