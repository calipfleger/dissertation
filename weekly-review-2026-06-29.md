# Weekly literature review — 2026-06-29

**Source:** WebSearch fallback — `semanticSearch` was unavailable this run (**10th consecutive**: 06-03, 06-09, 06-22, 06-23, 06-24, 06-25, 06-26, 06-27, 06-28, 06-29). These are **unverified candidates only**. They are **NOT** added to `bibliography.bib` or `chapterN.qmd` (no-fabrication rule). C should re-run each through a scholarly index (semanticSearch / Scholar / publisher DOI) before any citation.

**Chapter scanned:** Chapter 1 — iCESM Pacific Walker Circulation (ILME-PWC). **Rotation rationale:** no substantive user sessions ran on 2026-06-29 (automation cycle only; the idle Ch5 GDELT session is unchanged). Ch5's five search-queries are saturated by the 06-22/23/24/26 runs; Ch3 was scanned 06-27 (current); Ch4 06-28 (current). **Ch1 had not received a dedicated WebSearch scan in this window and is flagged in memory as an earlier-stage chapter** — so this run rotates to Ch1 for fresh, non-duplicative coverage. Ran all five `chapter-1-ilme-pwc/literature/search-queries.md` questions (PWC strengthen-vs-weaken under anthropogenic forcing; δ¹⁸O_P as PWC fingerprint in isotope GCMs; LME tropical-Pacific SST–SLP under combined forcing; iso2k constraints on past PWC; zonal SST-gradient response reconciling model-weakening vs observed-strengthening).

---

## Candidate leads (UNVERIFIED — verify DOI + scope before citing)

### Query 1 — PWC strengthening vs. weakening under anthropogenic forcing
- **Walker circulation strengthening driven by sea-surface temperature changes outside the tropics** — *Nature Geoscience* 2024, DOI `10.1038/s41561-024-01510-5`. Attributes recent observed PWC strengthening to extratropical SST changes rather than tropical-only forcing — a mechanism angle not yet represented in the Ch1 bib. **Strong lead.**
- Re-surfaced already-in-bib foundations: `vecchi2006weakening`, `wu2021strengthened`, `heede2023colder`, `shrestha2023anthropogenic`, `wu2024emergence`, `falster2023pwc` — Ch1 anthropogenic/forced-PWC core confirmed current.
- IPO attribution figure (~63%, 51–72% of observed strengthening from the Interdecadal Pacific Oscillation phase transition) recurred across results — a number worth sourcing to its origin paper if used (do **not** hardcode; cite `[@bibkey]` once verified).

### Query 2 — δ¹⁸O_P as a PWC diagnostic fingerprint in isotope-enabled GCMs
- No new (2024–2026) hit beyond the already-cited core: `falster2021precipitation` / "Imprint of the Pacific Walker Circulation in Global Precipitation δ¹⁸O" (*J. Climate* 2021), `dee2018vertical`, `brady2019icesm`, `bong2026wisomip`, `hu2020speedy`. The δ¹⁸O_P-fingerprint literature for Ch1 is confirmed current; the 2026 WisoMIP isotope-model-evaluation thread is already captured by `bong2026wisomip`.
- ⚠ relevance uncertain: an ESSD 2026 Seoul precipitation-isotope dataset (`essd-18-1489-2026`) surfaced — regional observational d-excess/Δ′¹⁷O record, **not** PWC-scale; flagged, not a fit.

### Query 3 — LME tropical-Pacific SST/SLP under combined volcanic+GHG forcing
- **Multidecadal Temperature Variability in the CESM Last Millennium Ensemble** — Fernandez et al., *GRL* 2025, DOI `10.1029/2024GL113393`. Directly on LME internal vs. forced multidecadal variability — squarely in Ch1's model. **Strong lead.**
- Re-surfaced: `falster2023pwc` (millennium PWC reconstruction; volcanic forcing *unlikely* to explain the 1992–2011 strengthening → anthropogenic-aerosol or natural variability) and the "Stability of ENSO teleconnections during the last millennium in CESM" thread — both already anchor the Ch1/Ch2 boundary.

### Query 4 — iso2k proxy constraints on past PWC
- No new standalone 2024–2026 paper beyond `konecky2020iso2k` (database) + `falster2023pwc` (the millennium multi-proxy PWC reconstruction ensemble that *uses* iso2k-type records). iso2k-constraint coverage for Ch1 confirmed current.

### Query 5 — zonal SST-gradient response: reconciling model weakening vs. observed strengthening
- **Observed Increase in Tropical Pacific Ocean Surface Cold–Warm Contrast Is Well Outside Model-Simulated Range** — Conde et al., *GRL* 2025, DOI `10.1029/2025GL116409`. The observed zonal-gradient strengthening sits outside the model forced-response range → internal variability alone insufficient. **Strong lead, directly on the chapter's central tension.**
- **A Dynamical Model of the Tropical Pacific Zonal SST Gradient Change Under Global Warming** — Ying et al., *GRL* 2026, DOI `10.1029/2025GL120397`. **Lead.**
- **Assessment of externally forced tropical Pacific SST patterns: evaluation of statistical extraction methods using multi-model large ensembles** — *Environ. Res. Commun.* 2025/2026, DOI `10.1088/2515-7620/ae67e6`. Methods for separating forced from internal SST patterns — relevant to Ch1's forced-vs-internal framing. **Lead.**
- **Present-day tropical precipitation and cloud feedbacks determine future equatorial Pacific trends** — PMC `PMC12965325`. ⚠ relevance uncertain (cloud-feedback emergent-constraint angle); flagged.
- ⚠ relevance uncertain: Jiang et al. *JGR Oceans* 2025 (`10.1029/2024JC022222`, subsurface cooling → SST pattern formation) — mechanism-adjacent, oceanographic; flagged, not added.
- Re-surfaced already-in-bib: `fu2023bjerknes`, `wills2022systematic`, `liu2018pacific` — Bjerknes/model-bias cluster confirmed current.

---

## Net result

- **0 citations added** to `chapter-1-ilme-pwc/literature/bibliography.bib` (no-fabrication; semanticSearch down).
- **5 strong new leads** for C to verify (Nature Geosci 2024 `s41561-024-01510-5`; Fernandez GRL 2025 `2024GL113393`; Conde GRL 2025 `2025GL116409`; Ying GRL 2026 `2025GL120397`; ERC 2025 `ae67e6`) — all directly on Ch1's forced-vs-internal PWC / zonal-gradient question, none currently in the bib.
- **3 adjacent/uncertain leads** flagged (ESSD 2026 Seoul isotopes; PMC cloud-feedback constraint; Jiang JGR subsurface cooling) — NOT added.
- Ch1's δ¹⁸O-fingerprint and iso2k-constraint sub-literatures confirmed **current** (no gaps).
- **Thin spot:** the zonal-gradient discrepancy is moving fast (3 of the 5 strong leads are 2025–2026 GRL papers Ch1 doesn't yet cite) — worth a dedicated semanticSearch pass on this sub-question once the tool is restored.
