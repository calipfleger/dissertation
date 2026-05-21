# INVENTORY.md

> Complete catalog of files across the PhD dissertation project.
> Generated 2026-05-07. Status flags: 🟢 active · 🟡 stale · 🔴 duplicate · ⚪ output · ⚙️ config · 📄 prose · 🧪 scratch

## Summary

| # | Location | Files (top-level) | Total size | Notes |
|---|----------|-------------------|------------|-------|
| 1 | `awesome-lamarr-3ddc99/` (website) | 8 | ~13 KB | Tiny static site, recently updated |
| 2 | `Cladue/volcano enso/` (Ch2 code) | ~280 | 1.9 GB | 49 .py · 198 figs · 2 NetCDFs · `archive/`, `old_figures/` bloat |
| 3 | `Cladue/seasonal scaling icesm volc/` (Ch5 code) | ~75 | 71 MB | 23 .py · 50 figs · 1 stale draft .docx |
| 4 | `Cladue/shared-brain/projects/dissertation/` (book) | many | ~360 MB | 5 chapter folders · 6 .qmd · 5 weekly reviews |
| 5 | `~/Downloads/anomaly_data/` (input NetCDFs) | 36 | 2.8 GB | Samalas only — Tambora not yet present |

**Total disk footprint: ~5.1 GB** (mostly NetCDF inputs + Ch2 PDF figures).

Big findings up front:
- 🔴 **Ch2 figures fully duplicated**: every PNG in `volcano enso/` also lives in `dissertation/chapter-2-volc-enso/figures/` (sync target). PDFs only exist in `volcano enso/`.
- 🔴 **`old_figures/` (40 MB) and `archive/` (82 MB)** in `volcano enso/` are deprecated v2/v3 artifacts.
- 🔴 **chapter5_seasonal_volcanic_enso.docx** (27 KB, Apr 28 17:12) vs `_v2.docx` (9 MB, Apr 28 17:38) in seasonal scaling — v2 is keeper.
- 🟡 **3 chapters (1, 3, 4) have empty `code/` and `figures/` dirs** in the dissertation repo.
- 🟡 **Tambora NetCDFs missing** from `~/Downloads/anomaly_data/` — Ch5 design calls for them.
- ⚙️ **Hard-coded `/Users/calipfleger/...` paths** confined to `run_local.py` + `config.py` in both code repos. Sync config (`.figures-sources.yml`) uses portable relative paths.

---

## 1. Website — `awesome-lamarr-3ddc99/`

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `index.html` | Landing page with nav links | 2026-05-07 | 🟢 ACTIVE |
| `styles.css` | Site stylesheet | 2026-05-07 | 🟢 ACTIVE |
| `script.js` | Client-side JS (small) | 2026-05-07 | 🟢 ACTIVE |
| `pages/about.html` | About page | 2026-05-07 | 🟢 ACTIVE |
| `pages/contact.html` | Contact page | 2026-05-07 | 🟢 ACTIVE |
| `pages/research.html` | Research projects page | 2026-05-07 | 🟢 ACTIVE |
| `pages/presentations.html` | Presentations page | 2026-05-07 | 🟢 ACTIVE |
| `.git` | git pointer (worktree) | 2026-05-07 | ⚙️ CONFIG |
| `.claude/settings.local.json` | Per-repo Claude settings | 2026-05-07 | ⚙️ CONFIG |

**Note:** `index.html` references `pages/applications.html` and `pages/future-work.html` in its nav — **those files do not exist**. Broken links.

---

## 2. Chapter 2 — Volcano-ENSO — `Cladue/volcano enso/`

A research-code git repo. Pinatubo + El Chichón composite analysis, pseudo-coral δ¹⁸O on iso2k sites, n_eff = n/12, DPI=300. Figures sync into the dissertation repo via `.figures-sources.yml`.

### 2.1 Python pipeline (49 `*.py` files)

**Core utilities (imported elsewhere):**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `config.py` | Eruption indices, baselines, sites, paths | 2026-04-26 | ⚙️ CONFIG |
| `fig_utils.py` | Shared layout, colorbar, gridline helpers | 2026-04-25 | 🟢 ACTIVE |
| `io_utils.py` | NetCDF band-by-band readers | 2026-04-26 | 🟢 ACTIVE |
| `enso_utils.py` | Niño 3.4 extraction | 2026-04-26 | 🟢 ACTIVE |
| `processing_utils.py` | Anomaly + composite logic | 2026-04-25 | 🟢 ACTIVE |
| `compute_stats.py` | Writes `stats.json` for chapter prose | 2026-04-26 | 🟢 ACTIVE |
| `precompute.py` | Pre-caches `.npz` arrays in `_cache/` | 2026-04-26 | 🟢 ACTIVE |
| `run_local.py` | Top-level driver; **hard-coded paths** | 2026-04-27 | ⚙️ CONFIG |

**Map / composite figure scripts (1 figure each):**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `composite_mean_map.py` | Pseudo-coral composite mean map | 2026-04-25 | 🟢 ACTIVE |
| `annual_maps4.py` | Annual maps Y0–Y6 (4-panel) | 2026-04-25 | 🟢 ACTIVE |
| `djf_maps4.py` | DJF maps Y0–Y6 (4-panel) | 2026-04-26 | 🟢 ACTIVE |
| `eruption_diff_maps.py` | El Chichón vs Pinatubo difference maps | 2026-04-25 | 🟢 ACTIVE |
| `diff_map_pseudo_obs.py` | Pseudo-coral vs observed bias map | 2026-04-25 | 🟢 ACTIVE |
| `pseudo_vs_obs_map.py` | Pseudo-bg + obs circles overlay | 2026-04-25 | 🟢 ACTIVE |
| `corr_map_and_sites.py` | Correlation field + site markers | 2026-04-26 | 🟢 ACTIVE |
| `nino34_corr.py` | Niño 3.4 correlation map | 2026-04-26 | 🟢 ACTIVE |
| `nino34_corr_windows.py` | Sliding-window Niño 3.4 corr | 2026-04-26 | 🟢 ACTIVE |
| `effect_size_maps.py` | Cohen's d / effect-size maps | 2026-04-26 | 🟢 ACTIVE |
| `snr_maps.py` | Signal-to-noise maps | 2026-04-26 | 🟢 ACTIVE |
| `fdr_maps.py` | FDR-corrected significance maps | 2026-04-26 | 🟢 ACTIVE |
| `field_significance.py` | Monte-Carlo field-significance test | 2026-04-26 | 🟢 ACTIVE |
| `enso_regions.py` | ENSO-region-wise composites | 2026-04-26 | 🟢 ACTIVE |
| `proxy_skill_map.py` | Proxy skill score map | 2026-04-25 | 🟢 ACTIVE |
| `obs_d18o_meanstate_map.py` | LeGrand–Schmidt mean-state map | 2026-04-26 | 🟢 ACTIVE |
| `variance_partition.py` | Variance partitioning (volc vs ENSO) | 2026-04-26 | 🟢 ACTIVE |
| `sea_lag_maps.py` | Lagged SEA composite maps | 2026-04-25 | 🟢 ACTIVE |
| `nino34_continuous.py` | Continuous Niño 3.4 timeseries map | 2026-04-26 | 🟢 ACTIVE |

**SEA / scatter / time-series figures:**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `sea_nino34.py` | SEA of Niño 3.4 across eruptions | 2026-04-26 | 🟢 ACTIVE |
| `sea_nino34_dualdate.py` | SEA aligned by both dates | 2026-04-25 | 🟢 ACTIVE |
| `sea_bootstrap.py` | Bootstrap CIs for SEA | 2026-04-25 | 🟢 ACTIVE |
| `sea_obs_comparison.py` | SEA vs observations | 2026-04-25 | 🟢 ACTIVE |
| `sea_precon_colored.py` | Pre-condition-colored SEA | 2026-04-26 | 🟢 ACTIVE |
| `obs_sea_by_site.py` | Per-site SEA from observations | 2026-04-25 | 🟢 ACTIVE |
| `adams2003_sea.py` | Reproduces Adams (2003) SEA | 2026-04-25 | 🟢 ACTIVE |
| `emilegeay2008_nino34.py` | Reproduces Emile-Geay 2008 corr | 2026-04-26 | 🟢 ACTIVE |
| `forcing_response_scatter.py` | Forcing magnitude vs response | 2026-04-25 | 🟢 ACTIVE |
| `scatter_pseudo_vs_obs.py` | Scatter pseudo vs obs | 2026-04-25 | 🟢 ACTIVE |
| `site_timeseries.py` | Per-site timeseries | 2026-04-25 | 🟢 ACTIVE |
| `enso_amplitude.py` | ENSO amplitude pre/post | 2026-04-26 | 🟢 ACTIVE |
| `enso_precon.py` | ENSO pre-conditioning analysis | 2026-04-26 | 🟢 ACTIVE |
| `pseudo_coral_decomposition.py` | Decompose pseudo-coral δ¹⁸O | 2026-04-26 | 🟢 ACTIVE |
| `pseudo_corals.py` | Build pseudo-coral series | 2026-04-25 | 🟢 ACTIVE |
| `coral_coeff_sensitivity.py` | Coefficient sensitivity sweep | 2026-04-26 | 🟢 ACTIVE |
| `baseline_sensitivity.py` | Baseline-window sensitivity | 2026-04-19 | 🟡 STALE — older than rest |
| `iso2k_comparison.py` | iso2k vs model comparison | 2026-04-26 | 🟢 ACTIVE |
| `obs_d18o_bias_check.py` | Observation bias check | 2026-04-26 | 🟢 ACTIVE |
| `obs_d18o_fetch.py` | Download iso2k δ¹⁸O | 2026-04-19 | 🟡 STALE — likely one-time fetch |
| `qa_check.py` | QA + figure DPI checks; writes `draft_captions.md` | 2026-04-27 | 🟢 ACTIVE |

**Possibly orphaned / legacy:**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `plot_volc_enso.py` | Older monolithic plotter | 2026-04-17 | 🟡 STALE — predates modular refactor; **may be redundant** |

### 2.2 Configs & utilities

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `CLAUDE.md` | Agent operational manual | 2026-04-17 | ⚙️ CONFIG |
| `README.md` | Project README | 2026-04-19 | 📄 PROSE |
| `LICENSE` | License | 2026-04-19 | ⚙️ CONFIG |
| `.gitignore` | git ignore rules | 2026-04-17 | ⚙️ CONFIG |
| `requirements.txt` | Python deps | (small) | ⚙️ CONFIG |
| `package.json` | npm deps for `build_pptx_v4.js` | — | ⚙️ CONFIG |
| `package-lock.json` | npm lockfile | — | ⚙️ CONFIG |
| `node_modules/` | npm install dir | — | ⚪ OUTPUT (gitignored) |
| `quarto_nightly.sh` | Nightly render shell | — | ⚙️ CONFIG |
| `sync_figures.sh` | Figure sync helper | — | ⚙️ CONFIG (likely shadows the dissertation-repo version) |
| `build_pptx_v4.js` | Builds `VolcanoENSO_Analysis_v4.pptx` | 2026-04-14 | 🟢 ACTIVE |

### 2.3 Writeups (.docx, .pptx, .md)

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `ch2_methods.docx` | Methods section draft | 2026-04-25 | 📄 PROSE |
| `ch2_fig_analysis.docx` | Figure-by-figure analysis (3.6 MB) | 2026-04-25 | 📄 PROSE |
| `VolcanoENSO_CodeWalkthrough.docx` | Code walkthrough | 2026-04-17 | 📄 PROSE |
| `VolcanoENSO_FigureInventory.xlsx` | Figure inventory | 2026-04-18 | 📄 PROSE |
| `region_teleconnection_table.xlsx` | Teleconnection table | — | 📄 PROSE |
| `VolcanoENSO_Analysis_v4.pptx` | Main analysis deck (74 MB) | 2026-04-18 | 📄 PROSE |
| `coral_figs_volcanic_enso.pptx` | Coral figures deck (11 MB) | 2026-05-05 | 📄 PROSE |
| `draft_captions.md` | Auto-generated by `qa_check.py` | 2026-04-27 | ⚪ OUTPUT |
| `figure_inventory.md` | Manual figure inventory | — | 📄 PROSE |
| `literature_review.md` | Lit review notes | — | 📄 PROSE |
| `~$VolcanoENSO_Analysis_v4.pptx` | Office lockfile | — | 🧪 SCRATCH — **delete** |
| `~$VolcanoENSO_PseudoCoral_Analysis.pptx` | Office lockfile | — | 🧪 SCRATCH — **delete** |

### 2.4 Figures (grouped)

| Group | Count | Total size | Newest | Oldest | Status |
|-------|-------|-----------|--------|--------|--------|
| `*.png` (top-level) | 99 | 228 MB | 2026-04-28 | 2026-04-13 | 🟢 ACTIVE — duplicated into `dissertation/chapter-2-volc-enso/figures/` |
| `*.pdf` (top-level) | 99 | 371 MB | 2026-04-28 | 2026-04-13 | 🟢 ACTIVE — only here, not synced |
| `old_figures/` | 30 | 40 MB | 2026-04-19 (mixed) | — | 🟡 STALE — pre-refactor figures |
| `archive/` | 7 | 82 MB | 2026-04-14 | 2026-04-07 | 🟡 STALE — v2/v3 PowerPoints + js scripts |
| `sanity_check_plots_2026-04-28/` | 5 | 336 KB | 2026-04-28 | — | 🧪 SCRATCH — keep recent, retire later |

Notably, all PNGs map to a `.py` script except a handful of variant outputs (e.g. `*_global` versions sharing a parent script). No truly orphaned PNGs were found.

### 2.5 Data files (CSVs and NetCDFs)

| File | Purpose | Status |
|------|---------|--------|
| `coral_90significant_only-2.csv` (43 KB) | Coral sites passing p<0.10 | 🟢 ACTIVE |
| `coral_95significant_only.csv` (30 KB) | Coral sites passing p<0.05 | 🟢 ACTIVE |
| `ElChichoncoral_90_significant_only.csv` (47 KB) | El Chichón coral subset | 🟢 ACTIVE |
| `ElChichoncoral_95_significant_only-2.csv` (40 KB) | El Chichón coral subset | 🟢 ACTIVE |
| `iso2k_coral - iso2k_coral.csv` | iso2k sites (oddly named — has a `" - "` pattern from Google Sheets export) | 🟢 ACTIVE |
| `pinatubo_r18o_surface_1950_2005_raw-9d2aa47c.nc` (380 MB) | Pinatubo δ¹⁸O surface field | 🟢 ACTIVE |
| `pinatubo_temp_surface_1950_2005_raw.nc` (663 MB) | Pinatubo temp surface field | 🟢 ACTIVE |
| `legrand_schmidt_d18osw_v1_1.nc` (in `_cache/raw/`) | LeGrand-Schmidt δ¹⁸Osw obs | 🟢 ACTIVE |

### 2.6 Cache & generated

| Path | Size | Status |
|------|------|--------|
| `_cache/` (11 `.npz` files + `raw/`) | 133 MB | ⚪ OUTPUT — regenerable from `precompute.py` |
| `__pycache__/` | 600 KB | ⚪ OUTPUT |

---

## 3. Chapter 5 — Seasonal Scaling — `Cladue/seasonal scaling icesm volc/`

iCESM Samalas (1258 CE) seasonal scaling: 4 eruption months × 3 forcing magnitudes × 5 ensemble members. Tambora (1815) planned but **NetCDFs not yet present**.

### 3.1 Python pipeline (23 `*.py` files)

**Core utilities (copied from Ch2 with minor edits):**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `config.py` | Factorial design + paths (hard-coded `~/Downloads/anomaly_data/`) | 2026-04-28 | ⚙️ CONFIG |
| `io_utils.py` | I/O incl. `read_precip_d18o_band` | 2026-04-27 | 🟢 ACTIVE |
| `enso_utils.py` | Copied from Ch2 | 2026-04-27 | 🟢 ACTIVE |
| `fig_utils.py` | Copied from Ch2 | 2026-04-27 | 🟢 ACTIVE — **possible duplicate of Ch2's; needs cross-check** |
| `processing_utils.py` | Copied from Ch2 | 2026-04-27 | 🟢 ACTIVE |
| `nature_style.py` | Nature-style mpl rcParams | 2026-05-05 | 🟢 ACTIVE |
| `compute_stats.py` | Writes `stats.json` | 2026-04-28 | 🟢 ACTIVE |
| `run_local.py` | Top-level driver; **hard-coded paths** | 2026-05-05 | ⚙️ CONFIG |

**Figure scripts:**

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `sea_nino34_seasonal.py` | 4×4 SEA grid (Niño 3.4) | 2026-04-28 | 🟢 ACTIVE |
| `pub_sea_nino34.py` | Publication-ready SEA Niño 3.4 | 2026-05-05 | 🟢 ACTIVE |
| `composite_maps.py` | Composite SST/PRECT maps | 2026-04-28 | 🟢 ACTIVE |
| `pub_composite_maps.py` | Publication-ready composite maps | 2026-05-05 | 🟢 ACTIVE |
| `diff_maps_season.py` | Season-by-season difference maps | 2026-05-05 | 🟢 ACTIVE |
| `snr_maps.py` | SNR maps | 2026-05-05 | 🟢 ACTIVE |
| `annual_nino34_bar.py` | Annual Niño 3.4 bar | 2026-04-28 | 🟢 ACTIVE |
| `nino34_kde.py` | Niño 3.4 KDE | 2026-04-28 | 🟢 ACTIVE |
| `phase_portrait.py` | Phase portrait | 2026-05-05 | 🟢 ACTIVE |
| `hovmoller.py` | Hovmöller SST | 2026-04-30 | 🟢 ACTIVE |
| `iob_index.py` | Indian Ocean Basin index | 2026-04-30 | 🟢 ACTIVE |
| `walker_circulation.py` | Walker circulation analysis | 2026-04-30 | 🟢 ACTIVE |
| `subregion_prect.py` | PRECT subregion analysis | 2026-04-30 | 🟢 ACTIVE |
| `summary_heatmaps.py` | Summary heatmaps | 2026-04-30 | 🟢 ACTIVE |
| `spaghetti_sea.py` | Spaghetti plots per forcing | 2026-04-30 | 🟢 ACTIVE |

### 3.2 Configs & utilities

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `README.md` | Active README | 2026-04-27 | 📄 PROSE |
| `README.draft.md` | Older draft README | 2026-04-28 | 🟡 STALE — possibly redundant with `README.md` |
| `requirements.txt` | Python deps | 2026-04-27 | ⚙️ CONFIG |
| `stats.json` | Generated chapter stats | 2026-04-28 | ⚪ OUTPUT |

### 3.3 Writeups

| File | Purpose | Modified | Size | Status |
|------|---------|----------|------|--------|
| `chapter5_seasonal_volcanic_enso.docx` | Initial draft | 2026-04-28 17:12 | 27 KB | 🔴 DUPLICATE of v2 — **delete or archive** |
| `chapter5_seasonal_volcanic_enso_v2.docx` | Updated draft | 2026-04-28 17:38 | 9.0 MB | 🟢 ACTIVE — keeper |
| `chapter5_volcanic_enso.pptx` | Slide deck | 2026-04-30 | 14 MB | 📄 PROSE |
| `pub_figs_volcanic_enso.pptx` | Pub-ready figures deck | 2026-05-05 | 6.1 MB | 📄 PROSE |

### 3.4 Figures (grouped)

| Group | Count | Total size | Newest | Oldest | Status |
|-------|-------|-----------|--------|--------|--------|
| `*.png` + `*.pdf` (top-level) | 50 | ~50 MB | 2026-05-05 | 2026-04-28 | 🟢 ACTIVE |
| `sanity_plots/` | 3 | 664 KB | 2026-04-28 | — | 🧪 SCRATCH — has its own `_make_*.py` helpers + a README |

### 3.5 Cache & generated

| Path | Size | Status |
|------|------|--------|
| `__pycache__/` | 20 KB | ⚪ OUTPUT |

---

## 4. Dissertation Quarto book — `Cladue/shared-brain/projects/dissertation/`

### 4.1 Top-level configs and prose

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `_quarto.yml` | Quarto book config (5 chapters) | 2026-04-18 | ⚙️ CONFIG |
| `_publish.yml` | quarto-pub publish target (placeholder) | 2026-04-25 | ⚙️ CONFIG |
| `.figures-sources.yml` | Figure-sync source map | 2026-04-19 | ⚙️ CONFIG |
| `.gitignore` | git ignore rules | 2026-04-25 | ⚙️ CONFIG |
| `chicago-author-date.csl` | Citation style | 2026-04-18 | ⚙️ CONFIG |
| `custom.scss` | Theme overrides | 2026-04-18 | ⚙️ CONFIG |
| `index.qmd` | Book front matter | 2026-04-19 | 📄 PROSE |
| `references.qmd` | References stub (chapters use own bib) | 2026-04-18 | 📄 PROSE |
| `CLAUDE.md` | Agent operational manual | 2026-04-19 | ⚙️ CONFIG |
| `README.md` | Repo README | 2026-04-19 | 📄 PROSE |
| `SETUP.md` | Setup guide | 2026-04-19 | 📄 PROSE |
| `VERIFY.md` | Verification checklist | 2026-04-18 | 📄 PROSE |
| `LICENSE` | License | 2026-04-18 | ⚙️ CONFIG |
| `build.sh` | Full build (executable) | 2026-04-18 | ⚙️ CONFIG |
| `sync_figures.sh` | Figure sync (executable) | 2026-04-19 | ⚙️ CONFIG |

**Weekly review notes:**

| File | Modified | Status |
|------|----------|--------|
| `weekly-review-2026-04-25.md` | 2026-04-24 | 📄 PROSE |
| `weekly-review-2026-04-26.md` | 2026-04-26 | 📄 PROSE |
| `weekly-review-2026-04-30.md` | 2026-04-30 | 📄 PROSE |
| `weekly-review-2026-05-04.md` | 2026-05-04 | 📄 PROSE |
| `weekly-review-2026-05-05.md` | 2026-05-05 | 📄 PROSE |

### 4.2 Chapter folders

#### Chapter 1 — `chapter-1-ilme-pwc/` (iLME PWC)

| Path | Purpose | Modified | Status |
|------|---------|----------|--------|
| `chapter1.qmd` (19 KB) | Chapter prose | 2026-05-05 | 📄 PROSE |
| `VERIFY.md` | Per-chapter checklist | 2026-04-18 | 📄 PROSE |
| `code/` | empty | — | 🟡 STALE — **no analysis code yet** |
| `figures/` | empty | — | 🟡 STALE — **no figures yet** |
| `literature/bibliography.bib` (10 KB) | Refs | 2026-05-05 | 🟢 ACTIVE |
| `literature/literature-review.md` (12 KB) | Lit review | 2026-05-05 | 📄 PROSE |
| `literature/search-queries.md` | Search log | 2026-04-19 | 📄 PROSE |
| `presentations/chapter1-slides.qmd` | Slide source | 2026-04-18 | 📄 PROSE |
| `presentations/chapter1-progress.qmd` | Progress slides | 2026-04-18 | 📄 PROSE |
| `presentations/chapter1-{slides,progress}_files/` (231 files, 16 MB) | Quarto-rendered libs | — | ⚪ OUTPUT — should be gitignored |
| `drafts/from-drive/` (4 .md files) | Drive draft mirrors | 2026-04-17/18 | 📄 PROSE (gitignored) |
| `daily-summaries/` (2 files) | Per-day notes | 2026-05-05 | 📄 PROSE |

#### Chapter 2 — `chapter-2-volc-enso/`

| Path | Purpose | Modified | Status |
|------|---------|----------|--------|
| `chapter2.qmd` (45 KB) | Chapter prose — biggest | 2026-05-05 | 📄 PROSE |
| `chapter2.html` (89 KB) | Rendered output | 2026-04-25 | ⚪ OUTPUT — should not be committed |
| `chapter2.quarto_ipynb` (28 KB) | Quarto notebook intermediate | 2026-04-21 | ⚪ OUTPUT — should not be committed |
| `chapter2_files/` | Quarto execute results + mediabag | — | ⚪ OUTPUT |
| `VERIFY.md` (4.6 KB) | Detailed checklist | 2026-04-19 | 📄 PROSE |
| `code/compute_stats.py` (7.4 KB) | Computes `stats.json` | 2026-04-19 | 🟢 ACTIVE |
| `code/stats.json` | Stats values for prose | 2026-05-06 | ⚪ OUTPUT |
| `figures/` (101 PNGs + `seasonal-scaling/` subdir, 242 MB) | Synced from `volcano enso/` | 2026-05-04 | 🟢 ACTIVE — **all PNGs duplicate `volcano enso/`** |
| `figures/seasonal-scaling/` (10 PNGs, 13 MB) | Synced from `seasonal scaling icesm volc/` | 2026-05-04 | 🟢 ACTIVE |
| `literature/bibliography.bib` (12 KB), `literature-review.md` (25 KB), `search-queries.md` | Refs | 2026-05-05 | 📄 PROSE |
| `presentations/chapter2-slides.qmd`, `chapter2-progress.qmd` | Slide sources | 2026-05-04 | 📄 PROSE |
| `presentations/VolcanoENSO_Analysis_v4.pptx` (74 MB) | Slide PowerPoint copy | 2026-04-18 | 🔴 DUPLICATE of `volcano enso/VolcanoENSO_Analysis_v4.pptx` |
| `presentations/2026-04-17-recap.pptx` (135 KB) | Old recap deck | 2026-04-17 | 🟡 STALE |
| `presentations/{slides,progress}_files/` | Quarto libs | — | ⚪ OUTPUT |
| `drafts/from-drive/ch2-reading-list.md` | Drive mirror | 2026-04-18 | 📄 PROSE |
| `daily-summaries/` (10 files: Apr 17 → May 5) | Per-day notes | 2026-05-05 | 📄 PROSE |

#### Chapter 3 — `chapter-3-california-volc-enso/`

| Path | Purpose | Modified | Status |
|------|---------|----------|--------|
| `chapter3.qmd` (13 KB) | Prose | 2026-05-05 | 📄 PROSE |
| `VERIFY.md` | Stub | 2026-04-18 | 📄 PROSE |
| `code/`, `figures/` | empty | — | 🟡 STALE — **no analysis code yet** |
| `literature/bibliography.bib`, `literature-review.md`, `search-queries.md` | Refs | 2026-05-05 | 📄 PROSE |
| `presentations/chapter3-slides.qmd`, `chapter3-progress.qmd` | Slides | 2026-05-05 | 📄 PROSE |
| `presentations/{slides,progress}_files/` | Quarto libs | — | ⚪ OUTPUT |
| `drafts/from-drive/ch3-lit-review.md` | Drive mirror | 2026-04-18 | 📄 PROSE |
| `daily-summaries/` (1 file) | | 2026-05-05 | 📄 PROSE |

#### Chapter 4 — `chapter-4-biogeochem-geofish/`

| Path | Purpose | Modified | Status |
|------|---------|----------|--------|
| `chapter4.qmd` (8.9 KB) | Prose — smallest | 2026-05-04 | 📄 PROSE |
| `VERIFY.md` | Stub | 2026-04-18 | 📄 PROSE |
| `code/`, `figures/` | empty | — | 🟡 STALE — **no analysis code yet** |
| `literature/bibliography.bib` (7.0 KB), `literature-review.md` (16 KB), `search-queries.md` | Refs | 2026-05-04 | 📄 PROSE |
| `presentations/chapter4-slides.qmd`, `chapter4-progress.qmd` | Slides | 2026-04-18/23 | 📄 PROSE |
| `presentations/{slides,progress}_files/` | Quarto libs | — | ⚪ OUTPUT |
| `drafts/from-drive/README.md` (only) | Empty drive mirror | 2026-04-17 | 🟡 STALE |
| `daily-summaries/` (1 file) | | 2026-05-05 | 📄 PROSE |

#### Chapter 5 — `chapter-5-climate-tech-sentiment/`

| Path | Purpose | Modified | Status |
|------|---------|----------|--------|
| `chapter5.qmd` (23 KB) | Prose | 2026-05-05 | 📄 PROSE |
| `VERIFY.md` | Stub | 2026-04-18 | 📄 PROSE |
| `code/` | empty | — | 🟡 STALE — Sentiment Analysis code lives outside repo |
| `figures/slide{16-20}_*_dummy.png` (5 PNGs, 372 KB) | Placeholder dummies for advisor deck | 2026-04-16 | 🧪 SCRATCH — not real outputs |
| `literature/bibliography.bib` (11 KB), `literature-review.md` (22 KB), `search-queries.md` | Refs | 2026-05-05 | 📄 PROSE |
| `presentations/chapter5-slides.qmd`, `chapter5-progress.qmd` | Slides | 2026-05-05 | 📄 PROSE |
| `presentations/2026-04-17-recap.pptx` (135 KB) | Old recap | 2026-04-17 | 🟡 STALE |
| `presentations/{slides,progress}_files/` | Quarto libs | — | ⚪ OUTPUT |
| `drafts/from-drive/` (3 .md files: ian-lit-notes, lit-review-links, running-notes) | Drive mirrors | 2026-04-18 | 📄 PROSE |
| `daily-summaries/` (8 files) | Per-day notes | 2026-05-05 | 📄 PROSE |

**Note on Ch5:** the Sentiment Analysis code repo is at `~/Documents/Claude/Projects/Sentiment Analysis/` (separate, not under `Cladue/`) per `.figures-sources.yml`. The `seasonal scaling icesm volc/` repo is the **iCESM volcanic δ¹⁸O code** that's referenced from Ch2 as an extension (`figures/seasonal-scaling/` subdir), **not** from Ch5. The Ch5 chapter is the climate-tech-sentiment topic. This is a confusing labeling that bites; see Recommendations.

### 4.3 Build & sync infrastructure

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `scripts/check_citations.sh` | Citation linter | 2026-05-04 | ⚙️ CONFIG |
| `scripts/repo-hygiene-local.sh` | Local hygiene check | 2026-04-25 | ⚙️ CONFIG |
| `scripts/install-automation.sh` | Installs launchd nightly task | 2026-04-25 | ⚙️ CONFIG |
| `scripts/pre-commit-hook.sh` | git pre-commit hook | 2026-04-21 | ⚙️ CONFIG |
| `scripts/com.calipfleger.repo-hygiene.plist` | macOS launchd plist | 2026-04-19 | ⚙️ CONFIG |

### 4.4 CI workflows

| File | Purpose | Modified | Status |
|------|---------|----------|--------|
| `.github/workflows/render-quarto.yml` | GitHub Actions: render the book | 2026-04-25 | ⚙️ CONFIG |

### 4.5 Generated / cache

| Path | Purpose | Status |
|------|---------|--------|
| `.quarto/idx/`, `.quarto/project-cache/` | Quarto's index/cache | ⚪ OUTPUT |
| `_book/` | **Does not exist** — `quarto render` has not been run since cleanup | — |
| `_archive/` | **Does not exist** | — |
| `_freeze/` | **Does not exist** | — |

---

## 5. Input data — `~/Downloads/anomaly_data/`

36 NetCDFs, 2.8 GB total. Naming pattern: `{VAR}_anomaly_{Month}Samalas_{magnitude}.nc`.

| Variable | File count | Size each |
|---|---|---|
| `PRECT_anomaly_*Samalas_*.nc` | 12 (4 months × 3 magnitudes) | ~100 MB |
| `TS_anomaly_*Samalas_*.nc` | 12 | ~50 MB |
| `UV_wind_anomaly_*Samalas_*.nc` | 12 | ~100 MB (one is 90 MB — `JulSamalas_0.75x` looks slightly truncated) |

Months covered: Jan, Apr, Jul, Oct. Magnitudes: 0.5x, 0.75x, 1x. **Tambora files: 0** — Ch5 design calls for 4 Tambora simulations (Jan/Apr/Jul/Oct, 1x only). Either move the design back to Samalas-only or fetch the Tambora outputs.

⚠️ All files dated `Oct 28 2025`. Path is in user `Downloads/` — fragile if anyone empties Downloads.

---

## 6. Cross-cutting concerns

### 6.1 Duplicates (🔴)

1. **`chapter5_seasonal_volcanic_enso.docx` vs `_v2.docx`** in `seasonal scaling icesm volc/` — v1 is 27 KB (Apr 28 17:12), v2 is 9 MB (Apr 28 17:38). v2 is keeper.
2. **`VolcanoENSO_Analysis_v4.pptx`** appears in two locations:
   - `volcano enso/VolcanoENSO_Analysis_v4.pptx` (74 MB, Apr 18)
   - `dissertation/chapter-2-volc-enso/presentations/VolcanoENSO_Analysis_v4.pptx` (74 MB, Apr 18)
   Both are 74 MB; one should be a symlink or removed. The dissertation copy is gitignored (`**/presentations/*.pptx`).
3. **Ch2 figures duplicated**: every PNG in `volcano enso/` (99 files, 228 MB) also exists in `dissertation/chapter-2-volc-enso/figures/` after sync. PDFs are only in `volcano enso/`.
4. **`fig_utils.py`** exists in both `volcano enso/` (14 KB, Apr 25) and `seasonal scaling icesm volc/` (5.7 KB, Apr 27). README says "copied unchanged" but sizes differ — **needs cross-check**.
5. **`enso_utils.py`** (14 KB Ch2 vs 8.5 KB Ch5), **`processing_utils.py`** (11 KB vs 5.9 KB), **`io_utils.py`** (17 KB vs 8.7 KB) — same names, different sizes. The Ch5 versions are slimmer subsets, not exact copies.
6. **`old_figures/`** (40 MB, 30 files) and **`archive/`** (82 MB, 7 files: v2/v3 .pptx + scripts) inside `volcano enso/` — entirely superseded.
7. **`README.md` vs `README.draft.md`** in `seasonal scaling icesm volc/` — confirm which is current.
8. **Office lockfiles** (`~$VolcanoENSO_*.pptx`) in `volcano enso/` — delete, they're a sign Word/PowerPoint is currently open.

### 6.2 Stale candidates (🟡, files 6+ weeks old without obvious recent reference)

- `volcano enso/plot_volc_enso.py` (Apr 17) — predates the modular refactor; verify nothing imports it.
- `volcano enso/baseline_sensitivity.py` (Apr 19) and `obs_d18o_fetch.py` (Apr 19) — older than the rest of the pipeline.
- `volcano enso/sanity_check_plots_2026-04-28/` — sanity-check artifacts from a specific date.
- `dissertation/chapter-2-volc-enso/chapter2.html` and `.quarto_ipynb` — Apr 21/25 build outputs, should be regenerated cleanly.
- `dissertation/chapter-2-volc-enso/presentations/2026-04-17-recap.pptx` and `chapter-5/presentations/2026-04-17-recap.pptx` — same-named recap from a single date now ~3 weeks old.
- Empty `chapter-{1,3,4}-*/code/` and `chapter-{1,3,4}-*/figures/` directories — no progress for 3 weeks.

### 6.3 Orphaned figures

A diff of `*.png` basenames vs `*.py` basenames in `volcano enso/` shows ~40 PNGs without an exactly-named .py — but every one is a stylistic variant (e.g. `*_global`, `*_y0y3`, `*_y4y6`) emitted by a parent multi-output script (`annual_maps4.py`, `djf_maps4.py`, `eruption_diff_maps.py`, etc.). **No truly orphaned figures detected.**

### 6.4 Hard-coded paths

Searched all `*.py` files in both code repos. Hard-coded `/Users/calipfleger/...` is confined to:

| File | Line | Path |
|---|---|---|
| `volcano enso/run_local.py` | 39 | `DATA_DIR = "/Users/calipfleger/Documents/Claude/Projects/Cladue/volcano enso/"` |
| `volcano enso/run_local.py` | 40 | `OUTDIR   = "/Users/calipfleger/Documents/Claude/Projects/Cladue/volcano enso/"` |
| `seasonal scaling icesm volc/config.py` | 50 | `DATA_DIR = "/Users/calipfleger/Downloads/anomaly_data/"` |
| `seasonal scaling icesm volc/run_local.py` | 16, 31 | `/Users/calipfleger/Downloads/anomaly_data/` |
| `seasonal scaling icesm volc/run_local.py` | 32 | `/Users/calipfleger/Documents/Claude/Projects/Cladue/seasonal scaling icesm volc/` |

`.figures-sources.yml` for `chapter-5-climate-tech-sentiment` still uses `~/Documents/Claude/Projects/Sentiment Analysis/...` absolute paths and notes that they break in the sandbox. There's a commented-out fallback for after a `mv Sentiment\ Analysis Cladue/`.

The dissertation repo's `*.qmd` files were not searched here, but `_quarto.yml` has no hard-coded paths and `.figures-sources.yml` is the canonical pivot point.

---

## 7. Recommendations for Phase 2 (consolidation)

1. **Delete the duplicate Ch5 docx**: `rm "seasonal scaling icesm volc/chapter5_seasonal_volcanic_enso.docx"` (the 27 KB v1). Keep `_v2.docx` as canonical.
2. **Archive `volcano enso/old_figures/` and `volcano enso/archive/`** to a single `volcano enso/_archive/` (or delete after one final review). Saves 122 MB.
3. **Replace `dissertation/chapter-2-volc-enso/presentations/VolcanoENSO_Analysis_v4.pptx`** (74 MB) with a symlink or just delete it — it's gitignored anyway and the canonical lives in `volcano enso/`.
4. **Clean `.docx`/`.html`/`.quarto_ipynb` build artifacts** from `dissertation/chapter-2-volc-enso/` — these are regenerable via `./build.sh` and shouldn't be tracked.
5. **Remove Office lockfiles** `~$*.pptx` from `volcano enso/` (close PowerPoint first).
6. **Decide on `seasonal scaling icesm volc/` vs Ch5 mapping** — the directory name implies Ch5 but it actually feeds Ch2's `figures/seasonal-scaling/` subdir. Either rename the directory to `volcano enso seasonal/` or update prose to reflect that Ch5 is the climate-tech-sentiment topic and these iCESM seasonal results are a Ch2 extension.
7. **Move hard-coded paths into a single `.env` or `paths.yml`** read by `config.py` in both code repos. Currently spread across 5 lines in 4 files.
8. **Decide whether to fetch Tambora NetCDFs** or trim Ch5 design back to Samalas-only — `seasonal scaling icesm volc/README.md` calls for 16 configs but only 12 (Samalas) exist on disk.
9. **Fill or remove the empty Ch1/3/4 `code/` and `figures/` placeholders** so the structure reflects reality. If analysis hasn't started, an explicit `TODO.md` is clearer than empty dirs.
10. **Fix broken nav links in the website** (`pages/applications.html`, `pages/future-work.html` referenced but missing).
