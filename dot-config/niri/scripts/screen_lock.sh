#!/bin/bash

# --- Variabel Wayland ---
# Ganti 'intel_backlight' dengan nama driver/class monitor Anda 
MONITOR_NAME="intel_backlight" 
BRIGHTNESS_DIM_LEVEL="5%"
BRIGHTNESS_LEVEL="20%"

# --- Hentikan proses lama dan jalankan swayidle baru ---
pkill -9 swayidle

swayidle \
    timeout 540 "brightnessctl --device $MONITOR_NAME set $BRIGHTNESS_DIM_LEVEL" \
    resume "brightnessctl --device $MONITOR_NAME set $BRIGHTNESS_LEVEL" \
    timeout 600 "niri msg action power-off-monitors && $HOME/.config/niri/scripts/do_lock.sh" \
    resume "brightnessctl --device $MONITOR_NAME set $BRIGHTNESS_LEVEL && niri msg action power-on-monitors"
