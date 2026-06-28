# Weekly literature review — 2026-06-25

> **semanticSearch UNAVAILABLE (6th consecutive run: 06-03, 06-09, 06-22, 06-23, 06-24, 06-25).**
> These are **WebSearch fallback** candidates — **UNVERIFIED**, **NOT** added to any `bibliography.bib` or `chapterN.qmd`. They are leads for C to verify in a library session and add by hand. No DOIs are asserted here that came from a fabricated source; verify each before citing.

## Focus this run: Chapter 4 (Biogeochem × Geo-Fish)

Today's only substantive session was Ch4 (GEOFISH ensemble-mean debugging — `129BGC_nc_ensav.ipynb`), so this run targets the Ch4 search-queries (oxygen-minimum-zone / fish-habitat / CESM-BGC ensemble themes). Chapters 1–3 and 5 had no session activity and no semanticSearch, so were not scanned.

### Candidates (verify before citing)

1. **"Skillful multiyear prediction of marine habitat shifts jointly constrained by ocean temperature and dissolved oxygen"** — *Nature Communications* (2024). Aerobic habitat viability (joint temperature + O₂ constraint on organismal energy balance) is predictable in the upper ~600 m from initialized Earth-System-Model forecasts. **Highly relevant** — directly supports the Ch4 thesis that biogeochemical (O₂) covariates, not temperature alone, govern fish-habitat distribution, and that ensemble/initialized prediction is the right tool. https://www.nature.com/articles/s41467-024-45016-5

2. **"From nutrients to fish: Impacts of mesoscale processes in a global CESM-FEISTY eddying ocean model framework"** — *Progress in Oceanography* (2024). Couples CESM ocean BGC to the FEISTY fish-biomass model in an eddy-resolving configuration; quantifies how mesoscale physics propagates from nutrients up to fish. **Highly relevant** — a model-architecture precedent for linking CESM BGC output (the GEOFISH ensemble) to fish populations. https://www.sciencedirect.com/science/article/abs/pii/S0079661124001204

3. **"Next-generation ensemble projections reveal higher climate risks for marine ecosystems"** — *Nature Climate Change* (2021). Fish-MIP ensemble (CMIP6-forced marine ecosystem models) projects greater declines in global ocean animal biomass under both mitigation and high-emissions scenarios. Relevant as the multi-model-ensemble framing for fish-biomass projection. https://www.nature.com/articles/s41558-021-01173-9

4. **"Is the expansion of oxygen minimum zones impacting the health of modern ocean basins? A review"** — *ScienceDirect* (2025). Recent review of OMZ expansion and basin-scale consequences. Relevant background for the O₂-as-covariate framing; ⚠ relevance uncertain (review breadth vs. fish-population specificity — confirm fit). https://www.sciencedirect.com/science/article/pii/S2772883825001311

5. **(Classic / context)** Stramma et al., "Expansion of oxygen minimum zones may reduce available habitat for tropical pelagic fishes," *Nature Climate Change* 2 (2012). Foundational OMZ-shoaling → pelagic-habitat-compression result (tropical NE Atlantic oxygenated layer thinning ~1 m yr⁻¹, 1960–2010). Likely already known to C; listed for completeness as the anchor citation for the OMZ mechanism. https://www.nature.com/articles/nclimate1304

### Notes
- Dedupe: no overlap with weekly-review 06-22/06-23/06-24 (those were Ch5 GDELT-method candidates).
- None of the above are in `chapter-4-biogeochem-geofish/literature/bibliography.bib` as of this run — they are leads only.
- Action for C: verify items 1 and 2 first (highest relevance to the GEOFISH ensemble framework) and, if they hold up, add to the Ch4 bib + a `::: {.under-review}` paragraph in `chapter4.qmd`.
