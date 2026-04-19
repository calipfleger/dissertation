# One-time setup — GitHub + Quarto Pub

Run these on your Mac, **in order**, from the dissertation folder. Total time: ~10 minutes.

## 0. You should already have

- Quarto installed (`quarto --version` works).
- A GitHub account at `https://github.com/calipfleger`.
- Your `chicago-author-date.csl` file in the dissertation folder (already present).

If `gh` isn't installed:
```bash
brew install gh
```

---

## 1. Pre-flight cleanup

Build artifacts and operational files don't belong in the repo. The `.gitignore` will keep them out of new commits, but anything already on disk should be cleared first.

```bash
cd ~/Documents/Claude/Projects/Cladue/shared-brain/projects/dissertation/

# Remove rendered output (will be re-built by Quarto / CI)
rm -rf _book/ .quarto/ _freeze/

# Remove preview artifacts
rm -f presentations/daily/slide-*.jpg presentations/daily/*.pdf

# Sanity-check that gitignore covers what it should
git check-ignore -v drafts/from-drive/ \
                    chapter-2-volc-enso/presentations/2026-04-17-recap.pptx \
                    chapter-2-volc-enso/daily-summaries/2026-04-17.md 2>/dev/null \
  || echo "(no git repo yet — that's expected before step 3)"
```

---

## 2. Authenticate `gh` to GitHub (one-time)

```bash
gh auth login
```
- Choose **GitHub.com** → **HTTPS** → authorize via browser.

---

## 3. Initialize git + first commit

```bash
git init
git add .
git status                                  # ← read this output
git commit -m "Initial dissertation scaffold

- Quarto book project (5 chapters)
- Bibliography per chapter + Chicago author-date CSL
- GitHub Actions workflow for render + publish
- Three-tier license (prose all-rights-reserved; bib data open;
  code dual-licensed → MIT after first publication)"
```

**Read `git status` carefully before you commit.** Confirm:
- ✅ `_quarto.yml`, `index.qmd`, `chapterN.qmd` files all present.
- ✅ `chapter-N-*/literature/bibliography.bib` and `literature-review.md` for each chapter.
- ❌ NO `_book/`, `.quarto/`, or `_freeze/`.
- ❌ NO `drafts/from-drive/` content (those are private mirrors).
- ❌ NO `daily-summaries/` content (private operational notes).
- ❌ NO `*.pptx` (nightly recap binaries).

If any ❌ items show up as "Changes to be committed," check `.gitignore` and run `git rm -r --cached <path>` to untrack them, then re-commit.

---

## 4. Render once locally to verify

Before triggering CI, render locally — easier to debug.

```bash
quarto render
```

If all 5 chapters produce HTML + PDF without error, you're golden. If something fails, paste the output back to Claude and we'll fix before pushing.

Common issues:
- Missing Python module → add to `chapter-N/code/requirements.txt`.
- Citation key mismatch (`Citation 'foo2024' not found`) → check the `.bib` file has that entry.
- Missing CSL → confirm `chicago-author-date.csl` is in the dissertation root.

---

## 5. Create the public GitHub repo and push

```bash
gh repo create calipfleger/dissertation \
  --public \
  --description "PhD dissertation — Cali Pfleger, UCSB Bren — Quarto book" \
  --source=. \
  --push \
  --remote=origin
```

This creates the repo on GitHub and pushes the initial commit in one step.

---

## 6. First Quarto Pub publish (gets the auth token)

```bash
quarto publish quarto-pub
```
- A browser tab opens — sign in to Quarto Pub (or create the account with your `calipfleger@ucsb.edu` email).
- Authorize the CLI.
- Quarto renders + uploads. Site URL is printed at the end.

This step also writes the auth token into `~/.config/quarto/_publish.yml`.

---

## 7. Copy the Quarto Pub token into GitHub secrets

```bash
# Get the token (it's a long random string in this file):
cat ~/.config/quarto/_publish.yml

# Save it as a repo secret so CI can publish on every push:
gh secret set QUARTO_PUB_AUTH_TOKEN --repo calipfleger/dissertation
# Paste the token at the prompt, hit Enter, then Ctrl-D.
```

---

## 8. Trigger CI to verify end-to-end

```bash
gh workflow run render-quarto.yml --repo calipfleger/dissertation

# Wait ~5 minutes, then:
gh run list --repo calipfleger/dissertation --limit 3
```

A green ✓ on the most recent run means: CI rendered the book and published it. Your live site is up to date.

---

## 9. (Recommended) Notify your Ch1 co-authors

Ch1 lists Samantha Stevenson, Sloan Coats, Bronwen Knockey, and Georgina Falster as authors. Public draft repos with co-authors' names are normal in our field, but courtesy = email them a quick heads-up. Sample:

> Hi Samantha (cc Sloan, Bronwen, Georgina),
>
> I'm setting up my dissertation as a Quarto book in a public GitHub repo so my committee and I can track the live render: <https://calipfleger.quarto.pub/dissertation>.
>
> Your name appears on Chapter 1 (the iLME PWC paper). Right now the chapter is at the in-progress stage — abstract and key findings are there, results section is being filled in. The repo is public mainly so the committee can view the rendered website without logins; the underlying paper text isn't published anywhere else yet.
>
> If you'd prefer I keep the repo private until the chapter is closer to submission, just say so and I'll switch it. Otherwise, no action needed — I'll keep you in the loop as Ch1 evolves.
>
> Cali

---

## You're done

From now on:
- Every push to `main` auto-renders + republishes — about 5 minutes from `git push` to live site update.
- The nightly pipeline at 11:30pm runs phases 1–5 locally then commits + pushes — you wake up to a fresh dissertation site.
- Edit a `.qmd`, `git push`, refresh the site — that's the loop.

## Troubleshooting

- **CI render fails on a `{python}` chunk:** add the missing dependency to `chapter-N-<topic>/code/requirements.txt`. CI installs each chapter's requirements automatically.
- **CI render fails on a missing CSL:** confirm `chicago-author-date.csl` is present at the dissertation root and committed.
- **CI render fails on a missing `.bib`:** confirm each chapter's `literature/bibliography.bib` exists (even if empty placeholder).
- **CI publishes but Quarto Pub URL gives 404:** wait 60 seconds for CDN propagation, then refresh.
- **Quarto Pub token rejected:** regenerate with `quarto publish quarto-pub --no-render --no-prompt` locally, then re-add the new token to GitHub secrets via `gh secret set QUARTO_PUB_AUTH_TOKEN --repo calipfleger/dissertation`.
- **Want to make the repo private later:** `gh repo edit calipfleger/dissertation --visibility private --accept-visibility-change-consequences`.
- **Accidentally committed something private:** `git rm --cached <path>`, add to `.gitignore`, commit. (Note: it's still in git history. For real removal, use `git filter-repo` — ask Claude for the exact incantation if needed.)
