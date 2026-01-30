#!/usr/bin/env bash

# minimal rofi wallpaper changer

WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
THUMBNAILS_DIR="$HOME/Pictures/.thumbnails"

mkdir -p "$THUMBNAILS_DIR"

rofi_cmd() {
    rofi -dmenu -theme ~/.config/rofi/launcher/style.rasi
}

find "$WALLPAPERS_DIR" -maxdepth 1 -type f -printf "%f\n" | while read -r filename; do
    name="${filename%.*}"
    thumbnail="$THUMBNAILS_DIR/${name}.png"

    if [[ ! -f "$thumbnail" ]]; then
        convert "$WALLPAPERS_DIR/$filename" -resize 48x48 "$thumbnail" 2>/dev/null
    fi

    echo -e "$filename\0icon\x1f$thumbnail"
done | rofi_cmd | xargs -I {} feh --bg-scale "$WALLPAPERS_DIR/{}"
