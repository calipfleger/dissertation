# Weekly literature review — 2026-06-24 (nightly-pipeline Phase 4)

**Source:** WebSearch fallback — `semanticSearch` was unavailable this run (5th consecutive: 06-03, 06-09, 06-22, 06-23, 06-24). These are **unverified candidates only**. They are **NOT** added to `bibliography.bib` or `chapter5.qmd` (no-fabrication rule). C should re-run each through a scholarly index (semanticSearch / Scholar / publisher DOI) before any citation.

**Chapter scanned:** Chapter 5 — Climate-Tech Sentiment (only chapter with recent session activity; last substantive session 2026-06-09). Chapters 1–4 not scanned (no semanticSearch + no Ch1–4 session activity in this window).

**Dedupe:** Checked against weekly-review-2026-06-22.md (VADER-method layer + SRM social costs) and weekly-review-2026-06-23.md (comparative-framing + public-opinion substance, queries #2/#4/#5). No overlap — this run targets **search-query #3: how GDELT / the Global Knowledge Graph handles event attribution, bias correction, and temporal drift** — the methods layer under-covered by the prior two runs.

---

## Method layer — GDELT data quality, bias, and full-text reconstruction (supports Ch5 corpus-methods/limitations section)

The Ch5 corpus is built on GDELT, so its known accuracy, redundancy, and geographic-bias properties belong in the methods/limitations write-up. These candidates document them:

- **"Research on the Development and Application of the GDELT Event Database"** (MDPI *Data*, 2025, 10(10):158) — review/audit of GDELT for research use. Reports **key-field accuracy ≈55% and data redundancy ≈20%**, and recommends **data correction and deduplication before analysis**. Directly supports the Ch5 relevance-filter + dedup steps (validate_relevance.py / clean.py) and the methodological caveat that raw GDELT counts must be cleaned. Strong relevance to query #3. <https://www.mdpi.com/2306-5729/10/10/158>
- **"Global trends and influential factors of climate change adaptation recognition in GDELT"** (*Scientific Reports*, 2025 — s41598-025-11794-1) — uses the GDELT GKG to track climate-adaptation discourse globally; a recent worked example of GDELT applied to climate-policy attention dynamics, including the kinds of temporal/longitudinal validation Ch5 needs. Notes audits may not capture temporal variation in machine-coding performance and calls for multi-year, multi-language validation. Strong relevance (both method and substance). <https://www.nature.com/articles/s41598-025-11794-1>
- **"Free Access to World News: Reconstructing Full-Text Articles from GDELT"** (arXiv 2504.16063, 2025) — method for recovering full article text from GDELT metadata. Relevant to the Ch5 body-scraping layer (scrape_bodies.py / score_body_comparison.py) and the headline-vs-body divergence analysis. ⚠ Preprint — verify peer-review status. <https://arxiv.org/pdf/2504.16063>

## Method/limitations layer — geographic & source bias in GDELT

- **GDELT US-media over-representation & cross-dataset divergence** — multiple sources flag that GDELT's coverage is **skewed toward US/English-language outlets** (the strongest players in the tracked media industry), so article counts are readily influenced by US news volume; and a **GDELT-vs-Event-Registry comparison found significant differences in article counts and active media** (though news *geographies* were similar), advising use "with caution." Directly relevant to the Ch5 representativeness caveat for an English-language news corpus. Primary descriptive basis: "Understanding News Geography and Major Determinants of Global News Coverage of Disasters" (arXiv 1410.3710) and the MDPI 2025 review above. ⚠ relevance uncertain on the disasters paper (climate-adjacent, not climate-tech specific) — track as background. <https://arxiv.org/pdf/1410.3710>

---

## Notes for C
- This run completes coverage of the Ch5 search-queries: #1 (VADER methods, 06-22), #2/#4/#5 (comparative framing + public opinion, 06-23), and now #3 (GDELT methods/bias, 06-24). A full re-scan once semanticSearch returns would let these populate the bib directly.
- Highest-value method-layer lead: **MDPI *Data* 2025 GDELT audit** (~55% field accuracy, ~20% redundancy) — a citable justification for the Ch5 cleaning/dedup/relevance-filter pipeline. Verify venue/DOI, then it can anchor the corpus-limitations paragraph.
- Recurring blocker: `semanticSearch` down **5 consecutive runs** — these WebSearch lists are a stopgap, not a substitute.
- Carryover from 06-23: top substance lead remains **PMC10730943** (Twitter climate-tech sentiment; SRM<CDR/NbS; nature-proximity→positive) — still the natural anchor citation for the core finding once verified.
- The pre-existing Ch5 citation debt (placeholder/wrong DOIs: Zhang2025, Sanz2025, Hynek2025, PorterHulme2013) is still open and needs a manual library session — the pipeline cannot resolve it (no-fabrication).
