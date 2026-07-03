# Weekly literature review — 2026-07-03

**Chapter scanned:** Chapter 5 — Climate-Tech Sentiment (GDELT / VADER media framing of NbS, CDR, SRM)
**Method:** WebSearch fallback — `semanticSearch` UNAVAILABLE (13th consecutive run). Even-coverage rotation pick: Ch5 was the least-recently dedicated-scanned chapter (~06-26; since then 06-28 Ch4, 06-29 Ch1, 06-30 Ch2, 07-01 Ch3). All 5 Ch5 `search-queries.md` queries run.

## Result: 0 confirmed new citations added

The Ch5 bibliography (37 entries) is already current on every strong lead surfaced. WebSearch returned mostly material already in the bib, foundational/handbook chapters, or non-peer-reviewed preprints. Per the no-fabrication + semanticSearch-only rule, nothing was added to `bibliography.bib`; leads are flagged below for C to verify if desired.

### Already in bib (confirmed current)
- **Müller-Hansen et al. 2023** "Attention, sentiments and emotions towards emerging climate technologies on Twitter" — surfaced repeatedly as the canonical CDR-more-positive-than-SRM finding; already `mullerhansen2023attention`.
- **Mudassar et al. 2025** "Global trends and influential factors of climate change adaptation recognition in GDELT" (Scientific Reports, s41598-025-11794-1) — surfaced as a top GDELT-methodology hit; already `mudassar2025gdelt`.
- SRM/CDR public-perception + framing cluster (baum2025hope, buck2025solar, magistro2025partisanship, jacobson2025discourse, repke2024cdr, freeman2025nbs, bellamy2025carbon) all confirmed present; VADER/lexicon methods (hutto2014vader, barbaglia2024lexicon) present.

### Leads flagged NOT added
1. ⚠ **"Sentiment and Social Signals in the Climate Crisis: A Survey on Analyzing Social Media Responses to Extreme Weather Events"** (arXiv 2504.18837, 2025) — relevance uncertain: extreme-weather social-media-response survey, adjacent to Ch5's climate-*technology* framing focus, and an arXiv preprint (not a peer-reviewed venue per search-queries filters). C to judge if useful for the VADER/NLP-methods subsection.
2. ⚠ **"Temporal Analysis of Climate Policy Discourse: Dynamic Embedded Topic Modeling"** (arXiv 2507.06435, 2025) — relevance uncertain: models UNFCCC *policy decisions* 1995–2023, not GDELT news framing; arXiv preprint. Method-adjacent (temporal-drift handling) but off-corpus.
3. 🔎 **IVADER — "Analysis of customer reviews with an improved VADER lexicon classifier"** (J. Big Data, Springer, s40537-023-00861-x) — a domain-specific VADER improvement; could support the chapter's VADER-critique subsection, but the domain is customer reviews (not climate/news) and it predates the 2024+ emphasis. Borderline; left for C.

### Thin spot re-confirmed
The chapter's methodological VADER-critique / VADER-vs-transformer-vs-LLM comparison subsection would benefit most from a **dedicated semanticSearch pass once the tool is restored** — WebSearch keeps returning vendor blog posts and general surveys rather than the peer-reviewed methods papers the query is written for. Same limitation noted on prior fallback runs.

## Standing Ch5 lit debt (unchanged, needs C's library session)
- 4 bib entries still carry placeholder/wrong DOIs: **Zhang2025, Sanz2025, Hynek2025, PorterHulme2013** — the pipeline cannot resolve these (no fabrication). A manual library session is required to find the real papers or remove + rewrite the methodological justification that cites them.
