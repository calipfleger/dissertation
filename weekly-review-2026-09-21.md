# Weekly review — 2026-09-21

*Phase 4 of the nightly pipeline. Written by the 2026-09-21 run, which did not start until 2026-09-22 05:37.*

## Literature scan — not run, for the seventh consecutive time

| Metric | Value |
| --- | --- |
| Queries executed | **0** |
| Candidate papers returned | 0 |
| New citations added | 0 |
| Fabricated citations | **0** |
| Standing queries unexercised | **66** (Ch1 13 · Ch2 13 · Ch3 13 · Ch4 14 · Ch5 13) |
| Days since last query executed | **18** |

`semanticSearch` is absent from the toolset, re-confirmed this run by a tool search on paper / literature / citation keywords. What is available is `WebSearch`, Google Drive file search, calendar semantic search, Gmail thread search, Blender documentation search and Desktop Commander's file search — none of which returns peer-reviewed metadata with DOIs, and none of which can satisfy the no-fabricated-citations constraint. Zero citations were inserted, which is the correct outcome rather than a degraded one.

**This is empty capability, not an empty result set.** Worth restating because the two are easy to conflate in a log that reports zero either way. The last time queries actually ran (2026-09-03 and 2026-09-07) they returned 5/5 duplicates — genuine standing-query exhaustion — and that evidence has not grown since, because nothing has been asked. The `search-queries.md` files are all dated 2026-04-19 and have not been revised in five months; if and when the capability returns, the queries themselves are the next thing to look at.

**The fix is a connector, and it closes a second gap at the same time.** A Semantic Scholar or OpenAlex MCP connector would restore Phase 4 and also close the Crossref-verification gap that `context/literature-verification.md` tracks. Ch4 (14 queries) and Ch1 (13) are weighted most heavily and cost the most per missed run.

## Bibliography state — three independent reproductions now agree

Recomputed from source this run, without reference to the prior figures:

| Measure | Value |
| --- | --- |
| `.bib` **entries** across all five chapters | **174** |
| **Unique works** | **166** (8 keys defined in two chapters each) |
| Unique works cited somewhere in chapter prose | **139** |
| Unique works never cited anywhere | **27** |
| **Orphans, per-chapter prose (headline)** | **32** — Ch1 6 · Ch2 8 · Ch3 9 · Ch4 5 · Ch5 4 |

These are the same values the 2026-09-20 run derived and its verification subagent reproduced. **This run makes it three independent derivations in agreement**, which is enough to stop re-deriving them and treat the numbers as settled.

The reporting rule stands: headline **32** for the editorial question — entries sitting unused in their own chapter's `.bib`, which is what `check_citations.sh` mirrors — and **27** for the bibliographic question, works collected and never cited anywhere. Never headline 18 or 7; 18 credits progress slides, which are not the dissertation, and 7 additionally credits `literature/literature-review.md`, which is where this pipeline deposits its own paragraphs.

The duplication is harmless at render: `_quarto.yml` defines no book-level merged bibliography, so each chapter resolves its own file and the keys never collide. Seven of the eight overlaps are Ch2↔Ch3 — exactly where shared volcano–ENSO literature belongs — and the eighth is Ch1↔Ch2 on proxy-network references.

**One substantive divergence is still outstanding, five days on.** `robock2000volcanic` is not the same entry in both files: Ch2 has `Robock, Alan`, issue `2`, DOI `10.1029/1998RG000054`; Ch3 has `Robock, A.` and neither. Both render, differently, so one reference prints in two forms in the two chapters most likely to be read as a pair. Ch2's is complete — copying it over Ch3's is a one-minute fix, and it has been on the board since 2026-09-20.

## Citations

`check_citations.sh` — **PASS, 156/156 resolve** (Ch1 25 · Ch2 34 · Ch3 38 · Ch4 23 · Ch5 36). No unresolved keys anywhere in the dissertation. The known `@ucsb.edu` frontmatter false-flag remains **BSD-grep-on-the-Mac only**; the check passes clean under the sandbox's GNU grep, which is why verifying from the sandbox first is a real check rather than a formality.

## Standing blockers carried into next week

1. **`semanticSearch`** — 18 days, 66 queries unexercised. Needs a Semantic Scholar or OpenAlex connector.
2. **Ch2 seasonal-scaling figures** — 17 candidates staged and uninstalled at `figures/seasonal-scaling/_candidates-2026-09-07/`, 7 phantom references breaking `quarto render`, ~4.6 months of superseded 2026-05-04 renders against 2026-05-20 sources. Blocked on a decision that changes figures the prose was written against.
3. **`compute_stats.py`** — 15th consecutive no-op; 7 keys hard-`None`, 10 warnings firing, untouched since 2026-04-19, 26 days past escalation.
4. **CI verification** — `ci-watch` in its 19th consecutive degraded run; the workflow-presumed-disabled flag is 42 days stale with nine unexercised commits behind it. One click at `https://github.com/calipfleger/dissertation/actions` settles it.
5. **`git push` credentials** — exercised for the first time this run rather than predicted. Open issue #0.
6. **`robock2000volcanic`** — one-minute fix, five days outstanding.
