# Weekly literature review — 2026-06-22 (nightly-pipeline Phase 4)

**Source:** WebSearch fallback — `semanticSearch` was unavailable this run, so these are **unverified candidates only**. They are **NOT** added to `bibliography.bib` or `chapter5.qmd` (no-fabrication rule). C should re-run each through a scholarly index (semanticSearch / Scholar / publisher DOI) before any citation.

**Chapter scanned:** Chapter 5 — Climate-Tech Sentiment (only chapter with recent session activity; last substantive session 2026-06-09). Chapters 1–4 not scanned (no semanticSearch + no Ch1–4 session activity in this window).

---

## Method layer — VADER critique & lexicon/LLM alternatives

These speak directly to Ch5's standing citation debt around VADER limitations and the case for adding LLM/manual annotation.

- **"Enhancing VADER Sentiment Analysis Through Lexicon Expansion with BERT Word Embeddings"** — supports the documented VADER weakness (static lexicon, poor domain coverage) and a concrete remedy: expand the lexicon via BERT embeddings + cosine similarity. Relevant to Ch5's "why VADER alone is insufficient" argument. ⚠ Found on ResearchGate — peer-review venue/year unverified. <https://www.researchgate.net/publication/399120483>
- **"Temporal and Lexicon-Aware VADER-based Sentiment Analysis"** (EPJ Web of Conferences, ICATCICT 2025) — adds publication-timing weighting + lexicon-awareness to VADER for news; maps onto Ch5's headline-timing and temporal-drift concerns. ⚠ Conference proceedings, not a journal. <https://www.epj-conferences.org/articles/epjconf/pdf/2025/26/epjconf_icatcict2025_01010.pdf>
- **"On Quantifying Sentiments of Financial News — Are We Doing the Right Things?"** (arXiv 2312.14978) — methodological critique of lexicon-based sentiment on news text; transferable to climate-news sentiment validity. ⚠ Preprint. <https://arxiv.org/pdf/2312.14978>
- **"Analysis of customer reviews with an improved VADER lexicon classifier"** (Journal of Big Data, Springer, 2023) — peer-reviewed VADER improvement; useful as a methods-layer citation for lexicon enhancement. ⚠ relevance uncertain — domain is product reviews, not news/climate. <https://link.springer.com/article/10.1186/s40537-023-00861-x>

## Substance layer — SRM / CDR perception & framing

- **"The social costs of solar radiation management"** (npj Climate Action, 2025) — SRM social-cost / perception framing; potentially relevant to the Ch5 finding that contested governance status (SRM, and OAE-tracking-SRM) shapes media tone more than technology category. ⚠ relevance uncertain — appears to be social-cost modeling rather than media-framing/sentiment measurement. <https://www.nature.com/articles/s44168-025-00273-y>

---

## Notes for C
- Recurring blocker: `semanticSearch` has been down across the 06-03, 06-09, and 06-22 runs — these WebSearch lists are a stopgap, not a substitute. Restoring it would let the lit loop populate the bib directly.
- The pre-existing Ch5 citation debt (placeholder/wrong DOIs: Zhang2025, Sanz2025, Hynek2025, PorterHulme2013) is still open and needs a manual library session — the pipeline cannot resolve it (no-fabrication).
