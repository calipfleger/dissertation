#!/usr/bin/env bash
# install-automation.sh — idempotent installer for Mac-native launchd agents.
#
# Claude writes .plist files into scripts/ when it creates new loops.
# Run this installer to pick up any new agents (or reload updated ones)
# in one go. Safe to re-run any time — it's fully idempotent:
#
#   - Already-loaded agents with an older version are reloaded.
#   - Already-loaded agents at the same version are left alone.
#   - Newly-added agents are installed and loaded.
#   - Agents that have been removed from scripts/ are NOT auto-uninstalled
#     (safety — we don't remove user agents without explicit opt-in).
#
# Usage:
#   ./scripts/install-automation.sh             # install + load everything
#   ./scripts/install-automation.sh --list      # just list, don't change
#   ./scripts/install-automation.sh --unload    # stop running agents (keep files on disk)
#   ./scripts/install-automation.sh --uninstall # stop AND delete agent files (full removal)

set -eu

REPO="$(cd "$(dirname "$0")/.." && pwd)"
PLIST_DIR="$REPO/scripts"
AGENT_DIR="$HOME/Library/LaunchAgents"
ACTION="${1:-install}"

mkdir -p "$AGENT_DIR"

# Collect plists shipped by the repo.
shopt -s nullglob
plists=("$PLIST_DIR"/*.plist)
if [ ${#plists[@]} -eq 0 ]; then
    echo "No .plist files found in $PLIST_DIR — nothing to do."
    exit 0
fi

echo "Found ${#plists[@]} agent(s) in scripts/:"
for p in "${plists[@]}"; do
    echo "  · $(basename "$p")"
done
echo ""

case "$ACTION" in
    --list)
        echo "Current status in $AGENT_DIR:"
        for p in "${plists[@]}"; do
            label=$(basename "$p" .plist)
            installed="$AGENT_DIR/$(basename "$p")"
            if [ -f "$installed" ]; then
                if cmp -s "$p" "$installed"; then
                    echo "  = $label  (installed, up to date)"
                else
                    echo "  ≠ $label  (installed, needs update)"
                fi
            else
                echo "  + $label  (not yet installed)"
            fi
        done
        exit 0
        ;;

    --unload)
        # Stop running agents but LEAVE the plist files on disk so they can
        # be re-loaded later with `./install-automation.sh` (no re-copy needed).
        echo "Stopping all agents (files preserved on disk)..."
        for p in "${plists[@]}"; do
            label=$(basename "$p" .plist)
            target="$AGENT_DIR/$(basename "$p")"
            if [ -f "$target" ]; then
                launchctl unload "$target" 2>/dev/null || true
                echo "  stopped: $label"
            else
                echo "  (not installed): $label"
            fi
        done
        echo "To fully remove: ./scripts/install-automation.sh --uninstall"
        exit 0
        ;;

    --uninstall)
        # Stop AND delete the plist files. Use this for full removal.
        echo "Uninstalling all agents (stop + delete)..."
        for p in "${plists[@]}"; do
            label=$(basename "$p" .plist)
            target="$AGENT_DIR/$(basename "$p")"
            if [ -f "$target" ]; then
                launchctl unload "$target" 2>/dev/null || true
                rm -f "$target"
                echo "  uninstalled: $label"
            else
                echo "  (not installed): $label"
            fi
        done
        exit 0
        ;;

    install|"")
        # Default: install or reload each agent.
        for p in "${plists[@]}"; do
            label=$(basename "$p" .plist)
            target="$AGENT_DIR/$(basename "$p")"

            # If an installed version exists and is identical, skip.
            if [ -f "$target" ] && cmp -s "$p" "$target"; then
                echo "  = $label  (already current, skipped)"
                continue
            fi

            # Unload old version if present (harmless if not loaded).
            if [ -f "$target" ]; then
                launchctl unload "$target" 2>/dev/null || true
            fi

            # Copy and load the new version.
            cp "$p" "$target"
            if launchctl load "$target" 2>/dev/null; then
                echo "  ✓ $label  (installed and loaded)"
            else
                # Some newer macOS versions use bootstrap instead of load.
                if launchctl bootstrap "gui/$(id -u)" "$target" 2>/dev/null; then
                    echo "  ✓ $label  (installed via bootstrap)"
                else
                    echo "  ⚠ $label  (copied but load failed — check 'launchctl print user/$(id -u)/$label')"
                fi
            fi
        done

        # Make sure all .sh helpers in scripts/ are executable so the agents
        # can invoke them.
        for sh in "$PLIST_DIR"/*.sh; do
            [ -f "$sh" ] || continue
            chmod +x "$sh"
        done

        echo ""
        echo "Done. Currently loaded agents:"
        launchctl list | awk 'NR==1 || /calipfleger/' | head
        ;;

    *)
        echo "Unknown action: $ACTION"
        echo "Usage: $0 [install|--list|--unload|--uninstall]"
        exit 1
        ;;
esac
