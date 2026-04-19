# Dissertation — Cali Pfleger (UCSB Bren)

[![Render Quarto book](https://github.com/calipfleger/dissertation/actions/workflows/render-quarto.yml/badge.svg)](https://github.com/calipfleger/dissertation/actions/workflows/render-quarto.yml)

A Quarto book project for my PhD dissertation at the Bren School of Environmental Science & Management, UC Santa Barbara.

**Live site:** _link will appear here after first `quarto publish quarto-pub`._

## Chapters

| # | Working title | Folder |
| --- | --- | --- |
| 1 | Oxygen-Isotopic Expression of Forced Changes in the Pacific Walker Circulation (iCESM) | `chapter-1-ilme-pwc/` |
| 2 | Volcanic Forcing of the El Niño–Southern Oscillation | `chapter-2-volc-enso/` |
| 3 | California–Volcano–ENSO: A Coral-Based Correlation Study | `chapter-3-california-volc-enso/` |
| 4 | Biogeochemistry and Geographic Variation in Fish Populations _(working title)_ | `chapter-4-biogeochem-geofish/` |
| 5 | Climate Technology Sentiment: GDELT + VADER Analysis of News Coverage | `chapter-5-climate-tech-sentiment/` |

## Build locally

```bash
# One-time setup
brew install quarto

# From this folder:
quarto preview                                 # live-reload preview of the whole book
quarto preview chapter-2-volc-enso/chapter2.qmd  # preview one chapter
quarto render                                  # build _book/ (HTML + PDF)
quarto publish quarto-pub                      # publish to Quarto Pub
```

## Repository structure

```
dissertation/
├── _quarto.yml                  Book config (chapters, bibliography, formats)
├── index.qmd                    Preface
├── references.qmd               Auto-populated References page
├── chicago-author-date.csl      Citation style (download from zotero.org/styles)
├── chapter-N-<topic>/
│   ├── chapterN.qmd             Authoritative chapter draft
│   ├── code/                    Python scripts and notebooks
│   ├── daily-summaries/         Nightly auto-generated summary mds
│   ├── drafts/from-drive/       Local mirror of Drive working docs
│   ├── figures/                 PNG/PDF figure outputs
│   ├── literature/
│   │   ├── literature-review.md     Cited running review (auto-updated)
│   │   ├── bibliography.bib         BibTeX (Zotero-importable)
│   │   └── search-queries.md        Per-chapter literature loop config
│   └── presentations/           Reveal.js + PPTX recap decks
├── .github/workflows/
│   └── render-quarto.yml        CI: render + publish on push
└── _book/                       Render output (gitignored)
```

## Citation style

Default is Chicago author-date (`csl: chicago-author-date.csl` in `_quarto.yml`). Per-chapter overrides go in each chapter's YAML header.

## Reproducibility

- Analysis code (Python) is embedded in chapter `.qmd` files via `{python}` chunks.
- Re-rendering the book re-runs the analysis and refreshes all figures and numbers.
- `freeze: auto` in `_quarto.yml` skips re-running unchanged chunks.

## License

Draft material in this repository — including chapter prose, figures, and analysis code — is © 2026 Cali Pfleger. See [LICENSE](LICENSE) for terms (academic-use restrictive until publication; permissive for code under MIT after first publication).

## Acknowledgments

PhD work at UC Santa Barbara, Bren School of Environmental Science & Management.
Co-authors and collaborators acknowledged per chapter.
