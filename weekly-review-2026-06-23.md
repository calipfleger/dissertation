# Weekly literature review — 2026-06-23 (nightly-pipeline Phase 4)

**Source:** WebSearch fallback — `semanticSearch` was unavailable this run (4th consecutive: 06-03, 06-09, 06-22, 06-23). These are **unverified candidates only**. They are **NOT** added to `bibliography.bib` or `chapter5.qmd` (no-fabrication rule). C should re-run each through a scholarly index (semanticSearch / Scholar / publisher DOI) before any citation.

**Chapter scanned:** Chapter 5 — Climate-Tech Sentiment (only chapter with recent session activity; last substantive session 2026-06-09). Chapters 1–4 not scanned (no semanticSearch + no Ch1–4 session activity in this window).

**Dedupe:** Checked against weekly-review-2026-06-22.md (VADER-method layer + npj SRM social-costs). No overlap — this run targets the **substance/comparative-framing** and **public-opinion-linkage** queries (Ch5 search-queries.md #2, #4, #5) that the 06-22 run under-covered.

---

## Substance layer — comparative framing & sentiment of climate technologies (directly supports the core Ch5 finding)

The Ch5 dissertation-worthy finding is that **contested governance status (SRM, and OAE tracking SRM) shapes media tone more than technology category**, with CDR/NbS reading more positive. These independently corroborate that pattern:

- **"Attention, sentiments and emotions towards emerging climate technologies on Twitter"** (PMC10730943) — social-media sentiment/emotion study across climate technologies. Reports attention has shifted from general geoengineering to specific carbon-removal methods; **sentiments are more positive for carbon removal than solar radiation management; methods perceived closer to nature have the highest shares of positive sentiment.** This is the closest external corroboration of the Ch5 SRM-vs-CDR/NbS tone gap and the "nature-proximity → positive" gradient. Strong relevance. <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10730943/>
- **"Public perceptions and support of climate intervention technologies across the Global North and Global South"** (Nature Communications, 2024 — s41467-024-46341-5) — public-opinion/support data; finds Global South publics more favorable, with age, climate urgency, and vulnerability as explanatory variables (esp. for SRM). Maps to search-query #5 (demographic/political correlates of differential framing/support). <https://www.nature.com/articles/s41467-024-46341-5>
- **"Public perceptions on carbon removal from focus groups in 22 countries"** (Nature Communications, 2024 — s41467-024-47853-w) — cross-national qualitative perception study of CDR; notes that **assessing carbon removal and solar geoengineering side-by-side pushes perceptions toward carbon removal, especially biogenic ("nature-based") options** — a comparative-framing effect relevant to query #5. <https://www.nature.com/articles/s41467-024-47853-w>
- **"Carbon removal support is tempered by concerns over whether biological methods are worth it"** (Communications Earth & Environment, 2025 — s43247-025-02654-x) — recent (2025) public-support study; UK preference for CDR moderated by concerns about biochar, peatland restoration, perennial biomass. Useful counterweight showing NbS positivity is not unconditional. <https://www.nature.com/articles/s43247-025-02654-x>

## Method/framing layer — media frame taxonomies for greenhouse-gas removal

- **"Biochar in the UK Print News Media: Issue Frames and Their Implications for Opening up Debate About Land-based Greenhouse Gas Removal"** (PMC11574815) — print-news framing study of a GGR technology; frame taxonomy = Innovation, Economics, Security, Governance & Accountability, Risk, Justice, Substitution, Salvation, Tradition, with **Economics and Innovation pronounced and Risk/Justice weakly developed.** Directly relevant to the Ch5 LLM frame-coding plan (frames: scientific uncertainty, risk, opportunity, governance, public acceptance) — offers a published, news-specific frame inventory to benchmark against. Strong relevance. <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11574815/>

## Grey literature — track, do not cite

- **"Bipartisan Backlash Against Geoengineering and Carbon Removal in the United States"** (Carnegie Endowment for International Peace, Nov 2025) — think-tank policy analysis of rising US political opposition to geoengineering/CDR. ⚠ Not peer-reviewed — context/background only, not a citation. Useful for the Ch5 governance-contestation narrative. <https://carnegieendowment.org/research/2025/11/united-states-geoengineering-carbon-removal-bipartisan-backlash>

---

## Notes for C
- The first item (PMC10730943, "Attention, sentiments and emotions… on Twitter") is the highest-value lead — it is essentially a sister study to Ch5 (different platform, same comparative-sentiment question) and reaches the same SRM-vs-CDR/NbS conclusion. Prioritize verifying its DOI/venue and adding it once confirmed; it is a natural anchor citation for the core finding.
- Recurring blocker: `semanticSearch` down 4 consecutive runs — these WebSearch lists are a stopgap, not a substitute. Restoring it would let the lit loop populate the bib directly.
- The pre-existing Ch5 citation debt (placeholder/wrong DOIs: Zhang2025, Sanz2025, Hynek2025, PorterHulme2013) is still open and needs a manual library session — the pipeline cannot resolve it (no-fabrication).
