#!/usr/bin/env bash
# build.sh — render the whole dissertation: book + per-chapter slideshows.
#
# What this does:
#   1. quarto render          → builds the book (HTML + PDF) into _book/
#   2. quarto render <slides> → builds each chapter's reveal.js slideshow
#   3. cp slideshows into _book/ so the "View as slideshow →" link inside
#      each chapter page works on the published site.
#
# Usage (from this folder):
#   ./build.sh                # full build
#   ./build.sh --no-pdf       # skip PDF (faster for iteration)
#   ./build.sh --slides-only  # only re-render slideshows + copy
#
# The script exits non-zero if any step fails so CI can detect failures.

set -euo pipefail

cd "$(dirname "$0")"

MODE="full"
case "${1:-}" in
  --no-pdf)       MODE="no-pdf" ;;
  --slides-only)  MODE="slides-only" ;;
  "")             MODE="full" ;;
  *)              echo "Unknown flag: $1" >&2; exit 2 ;;
esac

echo "=== build.sh: mode=$MODE ==="

# ---------------------------------------------------------------------------
# 0. Sync figures from external analysis folders (per .figures-sources.yml)
# ---------------------------------------------------------------------------
if [ -x ./sync_figures.sh ]; then
  echo ""
  echo "=== [0/3] Syncing figures from analysis folders ==="
  ./sync_figures.sh || echo "  ⚠ sync_figures.sh exited non-zero (continuing build)"
fi

# ---------------------------------------------------------------------------
# 1. Render the book (HTML + PDF, unless --no-pdf or --slides-only)
# ---------------------------------------------------------------------------
if [ "$MODE" != "slides-only" ]; then
  echo ""
  echo "=== [1/3] Rendering the book ==="
  if [ "$MODE" = "no-pdf" ]; then
    quarto render --to html
  else
    # Render HTML first (fast, reliable), then PDF separately so PDF failures
    # don't block the HTML deliverable.
    quarto render --to html
    quarto render --to pdf || echo "  ⚠ PDF render failed (HTML still OK — continuing)"
  fi
fi

# ---------------------------------------------------------------------------
# 2. Render each chapter's reveal.js decks (both *-slides.qmd and
#    *-progress.qmd, plus any other .qmd in presentations/).
# ---------------------------------------------------------------------------
echo ""
echo "=== [2/3] Rendering per-chapter reveal.js decks ==="
slide_count=0
for slides in chapter-*/presentations/*.qmd; do
  if [ -f "$slides" ]; then
    echo "  → $slides"
    quarto render "$slides" --to revealjs
    slide_count=$((slide_count + 1))
  fi
done
echo "Rendered $slide_count deck(s)."

# ---------------------------------------------------------------------------
# 3. Copy slideshow HTML (and supporting files) into _book/ so the
#    "View as slideshow →" link inside each chapter resolves on the live site.
# ---------------------------------------------------------------------------
echo ""
echo "=== [3/3] Wiring slideshows into _book/ ==="
if [ ! -d "_book" ]; then
  echo "WARN: _book/ doesn't exist (use --slides-only without a prior book render?)."
  echo "      Skipping the copy step."
else
  for chapter_dir in chapter-*/; do
    src="${chapter_dir}presentations"
    dest="_book/${chapter_dir}presentations"
    if [ -d "$src" ]; then
      mkdir -p "$dest"
      # Copy any rendered HTML + supporting _files directory
      for f in "$src"/*.html "$src"/*_files; do
        [ -e "$f" ] || continue
        cp -R "$f" "$dest/"
        echo "  copied: $f → $dest/"
      done
    fi
  done
fi

echo ""
echo "=== build.sh: done ==="
echo "Open the website: open _book/index.html"
echo "Open a slideshow: open _book/chapter-1-ilme-pwc/presentations/chapter1-slides.html"
