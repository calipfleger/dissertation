# CLAUDE.md — dissertation repo operational manual

This is an onboarding doc for any AI agent (Claude Code, Claude Agent SDK, or
a fresh conversation) that opens this repo. Read it before editing anything.
Humans are also welcome.

## What this repo is

Cali Pfleger's PhD dissertation at UCSB Bren, authored as a Quarto book with
five self-contained chapters. It is *reproducible*: every in-text statistic
is pulled from `chapter-N-*/code/stats.json`, and every figure is synced
from an analysis folder. Prose and data stay in sync on every render.

Public GitHub: <https://github.com/calipfleger/dissertation>.

## The four canonical paths

1. **This repo on disk:** `~/Documents/Claude/Projects/Cladue/shared-brain/projects/dissertation/`
2. **Ch2 analysis code:** `~/Documents/Claude/Projects/Cladue/volcano enso/` (its own git repo, no remote)
3. **Ch5 analysis code:** `~/Documents/Claude/Projects/Sentiment Analysis/` (NOT inside Cladue mount — sandbox can't reach it)
4. **Sandbox view of Cladue:** `/sessions/<session-id>/mnt/Cladue/...`

Scripts in this repo use *relative paths* (`../../../volcano enso`) so they
resolve identically from the Mac and from a sandbox.

## The four canonical tools

| Tool | Purpose |
| --- | --- |
| `./build.sh` | One-command full build (sync figures → render book → render slideshows → wire everything into `_book/`) |
| `./sync_figures.sh` | Copy figures from analysis folders into chapter `figures/` dirs (PNG-only by default; PDF opt-in via `.figures-sources.yml`) |
| `scripts/check_citations.sh` | Verify every `[@bibkey]` in every `.qmd` resolves to the chapter's `bibliography.bib` |
| `scripts/pre-commit-hook.sh` | Installed at `.git/hooks/pre-commit`. Runs the citation check + TODO-marker check + stats.json soft-warning before every commit |

## Reproducibility contract (do not break)

1. **No hardcoded statistics in prose.** Every inline number (`r`, `p`, `n`,
   percentages, lag ranges, site counts) comes from
   `chapter-N-*/code/stats.json` via a `{python} val(key)` helper. If a
   stat is missing, the helper renders a conspicuous `⚠TODO⚠` sentinel on
   the live site. Never type a literal number into prose.

2. **No figures without a source.** Every figure in a `chapter-N-*/figures/`
   directory must be produced by an analysis script, then synced via
   `sync_figures.sh`. Don't hand-drop PNGs.

3. **Bibliographies are per-chapter.** Each chapter has its own
   `literature/bibliography.bib`. Don't merge them.

## Never-do rules

- **Never commit with `--no-verify`.** Fix the underlying issue instead.
- **Never hardcode statistics in `chapter-N.qmd`.** Add a key to
  `compute_stats.py`, regenerate `stats.json`, reference via `val(...)`.
- **Never add PDFs to `chapter-N-*/figures/`.** `.gitignore` already blocks
  them. PDFs are re-enabled per-project via `.figures-sources.yml`'s
  `formats:` key + a `.gitignore` edit when submission PDFs are needed.
- **Never use bash-4-only syntax** (`${var,,}`, `${var^^}`, `declare -A`,
  `mapfile`). macOS ships with bash 3.2. Use `tr`, `awk`, or explicit loops.
- **Never use `~/` paths in `.figures-sources.yml`.** The sandbox's `~`
  doesn't point at the author's Mac home. Use relative paths
  (`../../../volcano enso`) instead.
- **Never force-push or reset `main`.** `repo-hygiene` auto-handles
  stale-lock cleanup and conservative commits; emergency git surgery is a
  human-only action.

## How automation fits in

Four scheduled loops operate on this repo (managed at
`~/Documents/Claude/Scheduled/<task-id>/SKILL.md` on C's Mac):

| Task | Cadence | Purpose |
| --- | --- | --- |
| `nightly-session-recap` | 11:32 PM daily | 5-phase pipeline: session recap, memory consolidation, feedback review, literature scans, figures + git push |
| `volcano-enso-memory-sync` | 11:07 PM daily | Updates volcano-ENSO project state from git log + file inventory |
| `repo-hygiene` | 2:03 AM daily | Defensive backup for Phase 5: self-heals `.git/index.lock`, sweeps junk files, runs pre-commit hook, commits+pushes anything the nightly missed |
| `weekly-verification-audit` | Mondays 8 AM | Audits VERIFY.md + stats.json across chapters, writes digest |

If you (the agent reading this) are about to make a change that a loop would
anyway handle at 2 AM, prefer letting the loop do it.

## Where to read more

- `README.md` — public-facing intro, chapter summaries, build instructions
- `VERIFY.md` (root) + `chapter-N-*/VERIFY.md` — per-chapter audit checklists
- `.github/workflows/render-quarto.yml` — CI config (HTML-only for now)
- `_quarto.yml` — book config (chapters, CSL, output formats)
- `.figures-sources.yml` — figure-sync source map
- This project's auto-memory lives at `.auto-memory/` in the cowork session
  directory (outside the repo). If you're running as Claude inside cowork,
  that auto-memory supplements this file.

When in doubt, read the file. Don't guess.
