#!/bin/bash

#--- NOTES ---
#
# Prerequisted: sudo pacman -S htmlq swaybg
# Use:
#   ./wall_auto_unsplash.sh
#   ./wall_auto_unsplash.sh {photo-id}
#   example: ./wall_auto_unsplash.sh photo-1542704504091-49b394c14bb2
#
# Adapted for Niri WM.
#--- NOTES ---

image_id=$1

# Konfigurasi

#DAY_QUERY="day,nature,landscape,green"
#NIGHT_QUERY="night,star"
DAY_QUERY="car,concept"
NIGHT_QUERY="tech,car"

DAY_START=6  # Jam 6 pagi
NIGHT_START=18  # Jam 6 sore

# Fungsi untuk mengunduh wallpaper dari Unsplash
download_wallpaper() {
    query=$1

    if [ -n "$query" ]; then
        search_url="https://unsplash.com/wallpapers"
        
        # Mengambil halaman pencarian
        search_page=$(curl --silent "$search_url" | htmlq 'div[data-testid="masonry-grid-count-three"]')
        
        # Ekstrak ID gambar dari halaman pencarian
        image_id=$(echo "$search_page" | grep -Eo 'photo-[0-9]+(-[a-zA-Z0-9]+)?' | sort | uniq | shuf | head -n 1)
        echo "image_id: $image_id"
    fi

    if [ -n "$image_id" ]; then
        # Mengambil halaman gambar
        echo "https://images.unsplash.com/$image_id"
        image_url="https://images.unsplash.com/$image_id?q=80&w=1920&auto=format&fit=crop"
        
        if [ -n "$image_url" ]; then
            CURRENT_WALLPAPER="$HOME/Pictures/current_wallpaper.jpg"
            echo "current_wallpaper: $CURRENT_WALLPAPER"

            # Hapus blur file lama jika ada
            #rm -rf $HOME/Pictures/blur-*.*

            # Mengunduh gambar, menimpa file yang ada
            wget -O "$CURRENT_WALLPAPER" "$image_url"

            # Simpan path untuk startup script
            echo "$CURRENT_WALLPAPER" > "$HOME/.cache/last_wallpaper.path"

            # Force wal to regenerate colors by deleting the specific cache file first.
            rm -f $HOME/.cache/wal/schemes/*

            # Generate color scheme with wal
            wal -i "$CURRENT_WALLPAPER"
            
            # Update brave/chromium theme
            # If you use this, make sure the script exists and is compatible.
            /home/i3wm/Downloads/ChromiumPywal/generate-theme.sh    

            echo "Wallpaper downloaded successfully"
            return 0
        else
            echo "Failed to get full image URL"
            return 1
        fi
    else
        echo "Failed to get wallpaper ID"
        return 1
    fi
}

# Fungsi untuk mengatur wallpaper
set_wallpaper() {
    # Kill any existing swaybg instance to prevent multiple wallpapers
    killall swaybg > /dev/null 2>&1
    # Set the new wallpaper
    swaybg -i "$CURRENT_WALLPAPER" -m fill &
}

# Fungsi untuk mendapatkan jam saat ini (dalam format 24 jam)
get_current_hour() {
    date +%H
}

# Fungsi untuk menentukan apakah sekarang siang atau malam
is_daytime() {
    current_hour=$(get_current_hour)
    if [ $current_hour -ge $DAY_START ] && [ $current_hour -lt $NIGHT_START ]; then
        return 0  # True, ini siang hari
    else
        return 1  # False, ini malam hari
    fi
}

# Main execution
if [ -n "$image_id" ]; then
    if download_wallpaper; then
        echo "Set wallpaper by image_id"
        set_wallpaper
    fi
elif is_daytime; then
    if download_wallpaper "$DAY_QUERY"; then
        echo "Set day wallpaper"
        set_wallpaper
    fi
else
    if download_wallpaper "$NIGHT_QUERY"; then
        echo "Set night wallpaper"
        set_wallpaper
    fi
fi
