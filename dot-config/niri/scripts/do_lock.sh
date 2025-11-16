#!/bin/bash

alpha='dd'

# Check if wal cache exists
WAL_COLORS="$HOME/.cache/wal/colors"
if [ ! -f "$WAL_COLORS" ]; then
  BACKGROUND='#282a36'
  FOREGROUND='#44475a'
  ACCENT='#ff79c6'
else
  # Read colors from pywal cache
  # Usually the first color is the background and the 7th is foreground
  BACKGROUND=$(sed -n '1p' "$WAL_COLORS")
  FOREGROUND=$(sed -n '7p' "$WAL_COLORS")
  ACCENT=$(sed -n '13p' "$WAL_COLORS")
fi

# Remove the leading '#' from colors and add alpha channel (ff for fully opaque)
BG=${BACKGROUND#\#}
FG=${FOREGROUND#\#}
ACC=${ACCENT#\#}

#PICTURE=~/Pictures/blur-wall.jpg
PICTURE="$(cat "$HOME/.cache/last_wallpaper.path")"

#--ind-pos="960:140" 
# Run i3lock with extracted colors

swaylock \
    --color="${BG}90" \
    --inside-ver-color="${ACC}ff" \
    --inside-wrong-color="${ACC}ff" \
    --inside-color="${BG}FF" \
    --ring-ver-color="${FG}ff" \
    --ring-wrong-color="${FG}ff" \
    --ring-color="${FG}ff" \
    --line-uses-ring \
    --key-hl-color="$BG$alpha" \
    --bs-hl-color="${ACC}ff" \
    --separator-color="${FG}ff" \
    --clock \
    --timestr="%H:%M" \
    --datestr="%a, %e %b %Y" \
    --font="JetBrains Mono NL Bold" \
    --indicator-radius=125 \
    --indicator-thickness=10 \
    --indicator \
    --image=$PICTURE
