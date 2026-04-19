# Ch2 — Verification checklist

## Citations (from `literature/bibliography.bib` + any inline in chapter2.qmd / chapter2-slides.qmd / chapter2-progress.qmd)

Status column meaning:
- ✅ you've read the paper's relevant section and the claim is supported
- ⏸ not yet reviewed
- ❌ paper doesn't support the claim; needs rework

| Key | Paper | Claim in chapter | Status | Reviewed by / date |
| --- | --- | --- | --- | --- |
| `@clement1996ocean` | Clement et al. 1996 — Ocean Dynamical Thermostat | Volcanic cooling produces El Niño–like SST response via Bjerknes feedback | ⏸ | |
| `@bjerknes1969` | Bjerknes 1969 — Atmospheric teleconnections | Bjerknes feedback mechanism | ⏸ | |
| `@liu2022land` | Liu et al. 2022 — GRL | Aerosol over tropical African land is more effective at triggering El Niño than aerosol over ocean | ⏸ | |
| `@dogar2024nao` | Dogar et al. 2024 — GRL | Positive-ENSO-preconditioned volcanic runs produce 2 °C El Niño; neutral/La Niña runs produce no ENSO modulation | ⏸ | |
| `@liu2024enso` | Liu et al. 2024 — JGR Atmos | Global δ18O network recovers weak El Niño 1y post-eruption; ENSO amplitude correlated with volcanic intensity (r≈0.46) | ⏸ | |
| `@jiang2023abrupt` | Jiang et al. 2023 — JGR Oceans | South China Sea corals show 39% ENSO variability increase at ~700 CE from combined solar+volcanic forcing | ⏸ | |
| `@wang2023pdo` | Wang et al. 2023 — JGR Atmos | PDO modulates ENSO-Asian summer monsoon teleconnection | ⏸ | |

## Figures (one row per figure referenced in chapter2-slides.qmd)

| Figure | Script that produces it | Caption accurate? | Stats from data? | Status | Reviewed by / date |
| --- | --- | --- | --- | --- | --- |
| nino34_timeseries.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| sea_nino34.png | `run_local.py bootstrap` → `sea_bootstrap.py` | ⏸ | ⏸ | ⏸ | |
| sea_obs_comparison.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| composite_mean_map.png | `eruption_diff_maps.py` | ⏸ | ⏸ | ⏸ | |
| sea_lag_maps.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| annual_sst_maps_y0y3.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| corr_sst_nino34_windows.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| enso_precon.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| enso_amplitude.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| sea_precon_colored.png | `sea_bootstrap.py --precon` | ⏸ | ⏸ | ⏸ | |
| enso_regions_composite.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| pseudo_vs_obs_map_y0y3.png | `skill_*.py` | ⏸ | ⏸ | ⏸ | |
| iso2k_comparison_composite.png | (fill in) | ⏸ | ⏸ | ⏸ | |
| proxy_skill_map_45.png | `skill_*.py` | ⏸ | ⏸ | ⏸ | |

## Inline numbers (claims in chapter2.qmd prose)

| Claim location | Value | Source | Pulled via `{python}` chunk from `code/stats.json`? | Status |
| --- | --- | --- | --- | --- |
| Intro paragraph | "r ≈ 0.46 in CESM-LME" (@liu2024enso) | Liu et al. 2024 | N/A — value from cited paper, not our analysis | ⏸ — confirm paper reports this r |
| Intro paragraph | "2 °C after eruption" (@dogar2024nao) | Dogar et al. 2024 | N/A — value from cited paper | ⏸ |
| Intro paragraph | "39% increase in ENSO variability at ~700 CE" (@jiang2023abrupt) | Jiang et al. 2023 | N/A | ⏸ |
| Methods §2.1 | "4 iCESM ensemble members" | Study design | Should be `stats["n_members"]` via `{python}` chunk | ❌ currently hardcoded — convert |
| Methods §2.1 | "89 tropical iso2k coral sites" | Study design | Should be `stats["n_iso2k_sites"]` | ❌ currently hardcoded — convert |
| Fig 6 caption | "n = 4 members, p < 0.05" | Computed | Should be `stats["ttest_n"]`, `stats["ttest_p_threshold"]` | ❌ hardcoded — convert |

## Tracking

- Last verified by: _(not yet)_
- Last verified date: _(not yet)_
- Count verified / total: 0 / 21
