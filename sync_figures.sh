#!/usr/bin/env bash
# sync_figures.sh — copy figure outputs from external analysis folders
# into each chapter's `figures/` directory.
#
# Reads:  .figures-sources.yml  (at this folder's root)
# Writes: chapter-*/figures/*.{png,pdf,jpg,jpeg,svg}
#
# Idempotent: only copies files that are new or newer than the destination.
# Never deletes anything — safe to re-run.
#
# Usage:
#   ./sync_figures.sh                # sync every chapter listed in the config
#   ./sync_figures.sh chapter-2      # sync one chapter (substring match)
#   ./sync_figures.sh --dry-run      # show what would happen, change nothing
#
# The nightly pipeline runs this at the start of Phase 5 so figures flow
# automatically from your analysis projects into the dissertation repo.

set -euo pipefail
cd "$(dirname "$0")"

filter=""
dry_run=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) dry_run=1 ;;
    --help|-h)
      sed -n '2,19p' "$0"
      exit 0
      ;;
    *) filter="$arg" ;;
  esac
done

cfg=".figures-sources.yml"
if [ ! -f "$cfg" ]; then
  echo "ERROR: $cfg not found. Create it at the dissertation root." >&2
  exit 1
fi

# Read sources for a given chapter using a tiny python one-liner (ships with macOS).
get_sources_for() {
  python3 - "$1" <<'PY'
import sys, yaml, os
chapter = sys.argv[1]
with open(".figures-sources.yml") as f:
    cfg = yaml.safe_load(f) or {}
entry = cfg.get(chapter) or {}
for p in entry.get("sources") or []:
    print(os.path.expanduser(p))
PY
}

total_copied=0
total_skipped_missing=0

for chapter_dir in chapter-*/; do
  chapter="${chapter_dir%/}"
  # Apply --filter if given (substring match)
  if [ -n "$filter" ] && [[ "$chapter" != *"$filter"* ]]; then
    continue
  fi

  dest="$chapter/figures"
  mkdir -p "$dest"

  # Read source list
  sources=()
  while IFS= read -r line; do
    [ -n "$line" ] && sources+=("$line")
  done < <(get_sources_for "$chapter")

  if [ ${#sources[@]} -eq 0 ]; then
    echo "· $chapter — no sources configured (skipping)"
    continue
  fi

  echo "▸ $chapter"
  for src in "${sources[@]}"; do
    if [ ! -d "$src" ]; then
      echo "    ⚠ source not found: $src"
      total_skipped_missing=$((total_skipped_missing + 1))
      continue
    fi
    echo "    ← $src"

    # Loop over supported image extensions. Use `find` + conditional cp so
    # we work on Macs without rsync in a portable way.
    for ext in png pdf jpg jpeg svg; do
      while IFS= read -r -d '' f; do
        base=$(basename "$f")
        target="$dest/$base"
        if [ ! -e "$target" ] || [ "$f" -nt "$target" ]; then
          if [ "$dry_run" = 1 ]; then
            echo "      (dry-run) would copy: $base"
          else
            cp -p "$f" "$target"
            echo "      copied: $base"
          fi
          total_copied=$((total_copied + 1))
        fi
      done < <(find "$src" -maxdepth 1 -type f -iname "*.$ext" -print0 2>/dev/null)
    done
  done
done

echo ""
if [ "$dry_run" = 1 ]; then
  echo "sync_figures.sh (dry-run): would copy $total_copied file(s). Missing sources: $total_skipped_missing."
else
  echo "sync_figures.sh: copied $total_copied file(s). Missing sources: $total_skipped_missing."
fi
