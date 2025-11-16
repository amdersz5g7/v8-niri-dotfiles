#!/bin/bash

#--- NOTES ---
#
# Prerequisted: swaybg
# use: 
#   ./wall_auto_wallhaven.sh
#   ./wall_auto_wallhaven.sh {image-id}
#   example: ./wall_auto_wallhaven.sh mp5wqm
#
# Adapted for Niri WM with static wallpaper path and wal cache fix.
#--- NOTES ---

image_id=$1
filetype=${2:-jpg} # Wallhaven can have jpg or png, defaults to jpg.

# Konfigurasi
#GLOBAL_QUERY="like%3Ap8652m"   # food
#GLOBAL_QUERY="like%3Aqr21xl"   # landscape
#GLOBAL_QUERY="like%3Ak7ggdm"    # spiderman
#GLOBAL_QUERY="like%3A1qprmv"    # cyber city
#GLOBAL_QUERY="like%3Aw5q29r"    # games
#GLOBAL_QUERY="like%3A3l1e1y"    # car
GLOBAL_QUERY="like%3Agw73wq"    # mountain

DAY_QUERY="day,nature,landscape,mountain"
NIGHT_QUERY="night,building"

DAY_QUERY=$GLOBAL_QUERY
NIGHT_QUERY=$GLOBAL_QUERY

DAY_START=6  # Jam 6 pagi
NIGHT_START=18  # Jam 6 sore

# Fungsi untuk mengunduh wallpaper dari Wallhaven
download_wallpaper() {
    query=$1

    if [ -n "$query" ]; then
        search_url="https://wallhaven.cc/search?q=$query&resolution=1920x1080&sorting=random&order=desc"        
        
        # Mengambil halaman pencarian
        search_page=$(curl -s "$search_url")
        #echo $search_page

        # Ekstrak ID gambar dari halaman pencarian
        image_id=$(echo "$search_page" | grep -oP 'https://wallhaven.cc/w/\K\w+' | sort | uniq | shuf | head -n 1) 
        echo "image-id: $image_id"
    fi

    if [ -n "$image_id" ]; then
    
        search_page=$(curl -s "https://wallhaven.cc/w/$image_id")
        if [ -z "$search_page" ]; then
            echo "Failed to fetch the webpage. Check your internet connection or URL."
            exit 1
        fi

        # echo $search_page > ./echo_wallhaven.txt
        if echo "$search_page" | grep -q " - PNG"; then
            filetype="png"
        else
            filetype="jpg"
        fi

        echo "file-type: $filetype"

        # get directory format
        DIR=${image_id:0:2}

        # Ekstrak URL gambar penuh dari halaman gambar
        image_url="https://w.wallhaven.cc/full/$DIR/wallhaven-$image_id.$filetype"
        
        if [ -n "$image_url" ]; then
            # Use a static path for the wallpaper. Note: we save as .jpg for consistency.
            CURRENT_WALLPAPER="$HOME/Pictures/current_wallpaper.$filetype"

            # Mengunduh gambar, menimpa file yang ada
            wget -O "$CURRENT_WALLPAPER" "$image_url" # > /dev/null 2>&1

            # Simpan path untuk startup script
            echo "$CURRENT_WALLPAPER" > "$HOME/.cache/last_wallpaper.path"

            # Force wal to regenerate colors by deleting the specific cache file first.
            wal -c

            # Generate color scheme with wal
            wal -i "$CURRENT_WALLPAPER" --saturate 0.3 > /dev/null 2>&1
            
            # Update brave/chromium theme (optional)
            # If you use this, make sure the script exists and is compatible.
            $HOME/Downloads/ChromiumPywal/generate-theme.sh > /dev/null 2>&1    

            makoctl reload > /dev/null 2>&1

            # echo "Wallpaper downloaded successfully"
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

# Fungsi untuk mengatur wallpaper menggunakan swww
set_wallpaper() {
    # Daftar jenis transisi yang tersedia. not used: fide
    TRANSITION_TYPES=("wipe" "grow" "center" "outer")
    # Pilih jenis transisi secara acak
    RANDOM_TRANSITION=${TRANSITION_TYPES[$(( RANDOM % ${#TRANSITION_TYPES[@]} ))]}

    # swww akan menangani transisi dan daemon secara otomatis
    swww img "$CURRENT_WALLPAPER" --transition-type "$RANDOM_TRANSITION"

    ~/.config/niri/scripts/update_border_color.sh
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
        #echo "Set day wallpaper"
        set_wallpaper
    fi
else
    if download_wallpaper "$NIGHT_QUERY"; then
        #echo "Set night wallpaper"
        set_wallpaper
    fi
fi
