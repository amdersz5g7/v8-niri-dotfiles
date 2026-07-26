#!/bin/bash

# 1. Ambil data JSON mentah dari Niri
NIRI_OUTPUT=$(niri msg --json windows 2>/dev/null)

# Pengecekan awal: Jika layar kosong atau array Niri "[]", langsung sembunyikan modul
if [ "$NIRI_OUTPUT" = "[]" ] || [ -z "$NIRI_OUTPUT" ]; then
    echo '{"text": "", "class": "empty"}'
    exit 0
fi

# 2. Ambil PID, APP_ID, dan TITLE dari window aktif di Niri
WINDOW_DATA=$(echo "$NIRI_OUTPUT" | jq -r '.[] | select(.is_focused == true) | "\(.pid)|\(.app_id)|\(.title)"' 2>/dev/null)

IFS="|" read -r PID APP_ID TITLE <<< "$WINDOW_DATA"

# Jika tidak ada window aktif yang fokus, sembunyikan modul
if [ -z "$PID" ] || [ "$PID" = "null" ]; then
    echo '{"text": "", "class": "empty"}'
    exit 0
fi

# Jika nama aplikasi kosong, beri teks cadangan
if [ -z "$APP_ID" ] || [ "$APP_ID" = "null" ]; then
    APP_ID="Unknown"
fi

# 3. Ambil persentase CPU dan RAM RSS (dalam KB) berdasarkan PID
STATS=$(ps -p "$PID" -o %cpu,rss --no-headers 2>/dev/null)

if [ -z "$STATS" ]; then
    echo '{"text": "", "class": "empty"}'
    exit 0
fi

# 4. Pisahkan variabel CPU dan RAM (RSS dalam KB)
read -r CPU RSS_KB <<< "$STATS"

# 5. Konversi KB ke MB atau GB agar human-readable
if [ "$RSS_KB" -ge 1048576 ]; then
    # Jika lebih dari atau sama dengan 1GB
    RAM_USAGE=$(awk "BEGIN {printf \"%.1f GB\", $RSS_KB/1048576}")
else
    # Jika masih dalam hitungan MB
    RAM_USAGE=$(awk "BEGIN {printf \"%.0f MB\", $RSS_KB/1024}")
fi

# 7. Tampilkan hasil akhir ke Waybar sebagai JSON bersih
FULL_TEXT="ActiveApp: [PID:$PID | APP_ID:$APP_ID]   $CPU%   $RAM_USAGE"
jq -cn --arg text "$FULL_TEXT" --arg class "active" '{"text": $text, "class": $class}'
