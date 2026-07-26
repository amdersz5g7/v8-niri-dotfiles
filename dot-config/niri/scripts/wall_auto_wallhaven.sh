#!/bin/bash
# wall_auto_wallhaven.sh — download & apply random wallhaven wallpaper
# Usage: ./wall_auto_wallhaven_v2.sh [day|night|image-id|query:SEARCH_QUERY]
# Dependencies: curl, wget, wal, awww, grep (pcre)
#
# Adapted for Niri WM with static wallpaper path and wal cache fix.
# v2.1: Manual mode support.

set -euo pipefail

# === Config ===
DAY_QUERY="day,nature,landscape,mountain"
NIGHT_QUERY="night,nature,landscape,mountain,ocean"

WALLPAPER_DIR="$HOME/Pictures"
CACHE_PATH="$HOME/.cache/last_wallpaper.path"
RESOLUTION="1920x1080"
DAY_START=6
NIGHT_START=18

# === Helpers ===
get_hour() { date +%H; }
is_daytime() { (( 10#$(get_hour) >= DAY_START && 10#$(get_hour) < NIGHT_START )); }

# === Core ===
download_wallpaper() {
    local query="${1:-}" image_id="${2:-}" filetype="jpg" page

    # Step 1: Get image ID (from arg or random search)
    if [[ -n "$image_id" ]]; then
        echo "ID: $image_id"
    elif [[ -n "$query" ]]; then
        page=$(curl -sf "https://wallhaven.cc/search?q=$query&resolution=${RESOLUTION}&sorting=random&order=desc") \
            || { echo "Search fetch failed"; return 1; }
        image_id=$(echo "$page" | grep -oP 'https://wallhaven.cc/w/\K\w+' | sort -u | shuf -n1)
        [[ -z "$image_id" ]] && { echo "No ID found for query: $query"; return 1; }
        echo "Query: $query | ID: $image_id"
    else
        echo "No query or ID provided"; return 1
    fi

    # Step 2: Fetch detail page, detect filetype
    page=$(curl -sf "https://wallhaven.cc/w/$image_id") \
        || { echo "Detail fetch failed"; return 1; }
    echo "$page" | grep -q " - PNG" && filetype="png"

    # Step 3: Download full image
    local dir="${image_id:0:2}"
    local url="https://w.wallhaven.cc/full/$dir/wallhaven-$image_id.$filetype"
    local out="$WALLPAPER_DIR/current_wallpaper.$filetype"

    echo "Downloading: $url"
    wget -q --show-progress --no-check-certificate -O "$out" "$url" \
        || { echo "Download failed"; return 1; }

    local size
    size=$(du -sh "$out" | cut -f1)
    echo "Downloaded: $size"

    # Step 4: Update cache + wal
    echo "$out" > "$CACHE_PATH"
    wal -c >/dev/null 2>&1
    wal -qi "$out" --saturate 0.3 >/dev/null 2>&1

    # Step 5: Optional integrations
    [[ -x "$HOME/Documents/AppScripts/ChromiumPywal/generate-theme.sh" ]] \
        && "$HOME/Documents/AppScripts/ChromiumPywal/generate-theme.sh" >/dev/null 2>&1
    makoctl reload >/dev/null 2>&1

    return 0
}

set_wallpaper() {
    local transitions=("wipe" "grow" "center" "outer")
    local chosen="${transitions[RANDOM % ${#transitions[@]}]}"
    local current
    current=$(cat "$CACHE_PATH" 2>/dev/null) || current="$WALLPAPER_DIR/current_wallpaper.jpg"

    awww img "$current" --transition-type "$chosen"
    "$HOME/.config/niri/scripts/update_border_color.sh" 2>/dev/null || true
}

# === Main ===
arg="${1:-}"

if [[ "$arg" == "day" ]]; then
    echo "Mode: Manual DAY"
    download_wallpaper "$DAY_QUERY" "" && set_wallpaper
elif [[ "$arg" == "night" ]]; then
    echo "Mode: Manual NIGHT"
    download_wallpaper "$NIGHT_QUERY" "" && set_wallpaper
elif [[ "$arg" == query:* ]]; then
    custom_query="${arg#query:}"
    echo "Mode: Custom QUERY ($custom_query)"
    download_wallpaper "$custom_query" "" && set_wallpaper
elif [[ -n "$arg" ]]; then
    echo "Mode: Manual ID"
    download_wallpaper "" "$arg" && set_wallpaper
elif is_daytime; then
    echo "Mode: Auto DAY"
    download_wallpaper "$DAY_QUERY" "" && set_wallpaper
else
    echo "Mode: Auto NIGHT"
    download_wallpaper "$NIGHT_QUERY" "" && set_wallpaper
fi
