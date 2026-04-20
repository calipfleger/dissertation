# One-time setup — Status & what's left

This is a running checklist of the one-time tasks needed to get the dissertation fully live. Items marked ✅ are already done; items marked ⏳ are still pending.

Last updated: 2026-04-19.

---

## ✅ Completed

- **Local Quarto install** — `quarto --version` works.
- **Git repo initialized** — see `git log` in this folder.
- **Initial commit + push** — landed on main as commit `28c3916` (2026-04-19).
- **Public GitHub repo created** at <https://github.com/calipfleger/dissertation>.
- **Pre-commit hook installed** at `.git/hooks/pre-commit` (runs citation integrity + stats.json soft-warning check).
- **HTML-only CI** — `.github/workflows/render-quarto.yml` renders on every push; PDF disabled until submission-ready.
- **Beginner-friendly README + `CLAUDE.md` + preface** — landed on main.
- **Bug-free figure sync** — `OUTDIR` trailing-slash bug squashed in the volcano-enso source; relative paths verified in `.figures-sources.yml`.
- **Scheduled loops active** — nightly pipeline, repo-hygiene, volcano-enso memory sync, weekly verification audit all registered.

---

## ⏳ Still pending

### 1. Install GitHub CLI (optional but useful)

`gh` is not currently installed. It's not required for anything ongoing — plain `git` works fine — but it makes some future tasks easier (viewing CI logs from the terminal, setting secrets in one command). Install when convenient:

```bash
brew install gh
gh auth login    # one-time
```

---

### 2. First Quarto Pub publish → capture the token

CI currently renders the book but can't publish until the `QUARTO_PUB_AUTH_TOKEN` secret is set in the repo. The token comes from the first local publish.

```bash
cd ~/Documents/Claude/Projects/Cladue/shared-brain/projects/dissertation
quarto publish quarto-pub
```

A browser tab opens — sign in to Quarto Pub (or create an account with `calipfleger@ucsb.edu`). Authorize the CLI. Quarto renders and uploads; the site URL is printed at the end (save it — it's also your live dissertation URL).

This step writes the token to `~/.config/quarto/_publish.yml`.

---

### 3. Save the token as a GitHub secret

**If `gh` is installed:**

```bash
cat ~/.config/quarto/_publish.yml        # find the "token:" line
gh secret set QUARTO_PUB_AUTH_TOKEN --repo calipfleger/dissertation
# paste the token when prompted, then Ctrl-D
```

**Without `gh`:**

1. `cat ~/.config/quarto/_publish.yml` — copy the token value.
2. Open <https://github.com/calipfleger/dissertation/settings/secrets/actions> in your browser.
3. Click **New repository secret**.
4. Name: `QUARTO_PUB_AUTH_TOKEN`. Value: paste the token.
5. **Add secret**.

After that, every push to `main` will auto-publish to your Quarto Pub URL.

---

### 4. Notify Ch1 co-authors

Ch1 lists Samantha Stevenson, Sloan Coats, Bronwen Knockey, and Georgina Falster. Public draft repos with co-authors' names are normal in this field, but it's courtesy to email a heads-up:

> Hi Samantha (cc Sloan, Bronwen, Georgina),
>
> I'm setting up my dissertation as a Quarto book in a public GitHub repo so my committee can track the live render: <https://github.com/calipfleger/dissertation>.
>
> Your name appears on Chapter 1 (the iLME PWC paper). Right now the chapter is at the in-progress stage — abstract and framing are there, results section is being filled in. The repo is public mainly so the committee can view the rendered website without logins; the underlying paper text isn't published anywhere else yet.
>
> If you'd prefer I keep the repo private until the chapter is closer to submission, just say so and I'll switch it. Otherwise, no action needed — I'll keep you in the loop as Ch1 evolves.
>
> Cali

---

### 5. Move `Sentiment Analysis/` into Cladue (Ch5 only)

The Ch5 analysis code lives at `~/Documents/Claude/Projects/Sentiment Analysis/` — outside the Cladue cowork mount. That means:
- The nightly pipeline can't sync its figures automatically.
- Any sandbox-based Claude session can't read the code.

To fix:

```bash
mv ~/Documents/Claude/Projects/"Sentiment Analysis" ~/Documents/Claude/Projects/Cladue/
```

Then the Ch5 entries in `.figures-sources.yml` should be rewritten to relative paths (same pattern as Ch2 — see the `../../../volcano enso` example). That edit is pre-staged in the commented-out block at the bottom of `.figures-sources.yml`; swap it in after the move.

---

### 6. Decide what to do with `~/Desktop/VOLC/volcano`

Your `find` command turned up this folder as a second volcano-ENSO tree. If it's an older snapshot, rename it out of `Desktop/` so it stops causing confusion:

```bash
mkdir -p ~/Archive
mv ~/Desktop/VOLC ~/Archive/VOLC-legacy-2025
```

If it's actively being used in parallel to `~/Documents/Claude/Projects/Cladue/volcano enso/`, pick one canonical copy and make the other a symlink (or delete it) — otherwise you'll silently edit two trees and lose work.

---

### 7. Push `volcano enso/` as its own public repo (disaster recovery)

The Chapter 2 analysis code currently lives as a local-only git repo at `~/Documents/Claude/Projects/Cladue/volcano enso/` with no remote. If your Mac dies, only the rendered figures survive (in the dissertation repo) — not the code that produced them. A second public repo solves this plus enables collaboration.

Scaffold is already in place (LICENSE added 2026-04-19, README cleaned up, `.gitignore` handles the big PPTX / NC / PDF files). Push when you're ready:

```bash
cd ~/Documents/Claude/Projects/Cladue/"volcano enso"

# 1. Confirm what will be pushed — should be ~30 Python files + small CSVs.
git status
git ls-files | wc -l          # should be ~50

# 2. If LICENSE is untracked, commit it:
git add LICENSE README.md
git commit -m "Add MIT license + README for public release"

# 3. Create the GitHub repo (via browser):
#    https://github.com/new
#    Name: volcano-enso-pipeline
#    Visibility: Public
#    Do NOT initialize (no README, no .gitignore, no license)

# 4. Push:
git branch -M main
git remote add origin https://github.com/calipfleger/volcano-enso-pipeline.git
git push -u origin main
```

Then add a `repository` link to the Ch2 chapter so readers can find it.

### 8. Fill in `compute_stats.py` with real data loads

Chapter 2's §§3.1 and 3.4 currently render `⚠TODO⚠` on the live site for four stats (`sea_sig_lag_min_months`, `sea_sig_lag_max_months`, `iso2k_sig_sites_chichon`, `iso2k_sig_sites_pinatubo`). Open `chapter-2-volc-enso/code/compute_stats.py` and replace the `None` values with real computations from the volcano-enso analysis cache. Then:

```bash
python3 chapter-2-volc-enso/code/compute_stats.py
# _warnings list should disappear if all values are filled
quarto preview chapter-2-volc-enso/chapter2.qmd
# visually confirm §§3.1 and 3.4 now show real numbers
```

---

## Troubleshooting

- **`.git/index.lock` file exists**: `rm -f .git/index.lock` (or `sudo rm -f` if owned by a different user). The `repo-hygiene` nightly loop self-heals this automatically.
- **Pre-commit hook fails on citations**: add the missing `@bibkey` entry to the chapter's `literature/bibliography.bib`, or remove the `[@bibkey]` from the `.qmd`.
- **CI render fails on a `{python}` chunk**: add the missing dependency to `chapter-N-*/code/requirements.txt`.
- **CI publishes but URL gives 404**: wait 60 seconds for Quarto Pub's CDN, then refresh.
- **Want the repo private later**: `gh repo edit calipfleger/dissertation --visibility private --accept-visibility-change-consequences` (or flip via the GitHub UI).
- **Accidentally committed private content**: `git rm --cached <path>`, add to `.gitignore`, re-commit. For full history removal (rare): ask Claude for a `git filter-repo` walkthrough.
