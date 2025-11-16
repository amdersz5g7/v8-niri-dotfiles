#!/bin/bash

# A script to update niri's border colors from the pywal cache.
# This version sets a two-color GRADIENT border.
# This should be run after wal sets a new wallpaper.

set -e

# File paths
WAL_COLORS="$HOME/.cache/wal/colors"
NIRI_CONFIG="$HOME/.config/niri/config.kdl"
TMP_CONFIG="${NIRI_CONFIG}.tmp"

# Check if wal cache exists
if [ ! -f "$WAL_COLORS" ]; then
  echo "Error: Wal color cache not found at $WAL_COLORS" >&2
  exit 1
fi

# Read colors for the gradients.
GRAD_ACTIVE_FROM=$(sed -n '3p' "$WAL_COLORS")   # color 5
GRAD_ACTIVE_TO=$(sed -n '7p' "$WAL_COLORS")     # color 7
GRAD_INACTIVE_FROM=$(sed -n '1p' "$WAL_COLORS") # color 0
GRAD_INACTIVE_TO=$(sed -n '9p' "$WAL_COLORS")   # color 9

if [ -z "$GRAD_ACTIVE_FROM" ] || [ -z "$GRAD_ACTIVE_TO" ] || [ -z "$GRAD_INACTIVE_FROM" ] || [ -z "$GRAD_INACTIVE_TO" ]; then
    echo "Error: Could not read all required colors from $WAL_COLORS" >&2
    exit 1
fi

# Define the new border block as a multi-line string and export it for awk
export NEW_BORDER_BLOCK="    border {
        // Config managed by update_border_color.sh
        width 6

        // Gradients override solid colors.
        active-gradient from=\"${GRAD_ACTIVE_FROM}\" to=\"${GRAD_ACTIVE_TO}\" angle=135 in=\"oklch longer hue\" relative-to=\"workspace-view\"
        inactive-gradient from=\"${GRAD_INACTIVE_FROM}\" to=\"${GRAD_INACTIVE_TO}50\" angle=0
    }"

# Use awk to replace the entire border block.
awk ' 
    BEGIN {
        p = 1;
        new_block = ENVIRON["NEW_BORDER_BLOCK"];
    }
    /^[[:space:]]*border[[:space:]]*{/ {
        print new_block;
        p = 0;
        brace_count = 1;
        next;
    }
    !p && /{/ { brace_count++; }
    !p && /}/ { brace_count--; if (brace_count == 0) p=1; next; }
    p { print; }
' "$NIRI_CONFIG" > "$TMP_CONFIG"

# Overwrite the original config. This action should trigger niri to reload automatically.
mv "$TMP_CONFIG" "$NIRI_CONFIG"

#echo "Niri border colors updated with gradients. Niri should have reloaded automatically."
