#!/bin/bash

# --- Variabel Wayland ---
# Ganti 'intel_backlight' dengan nama driver/class monitor Anda 
MONITOR_NAME="intel_backlight" 
BRIGHTNESS_DIM_LEVEL="5%"
BRIGHTNESS_LEVEL="20%"

# --- Hentikan proses lama dan jalankan swayidle baru ---
pkill -9 swayidle

swayidle \
    timeout 3 "~/.config/niri/scripts/do_lock.sh" \
    timeout 5 "~/.config/niri/scripts/screen_lock_capture_by_grim.sh"
