#!/usr/bin/env bash

# minimal rofi wallpaper changer

wallpapers_dir="$HOME/Pictures/wallpapers"
thumbnails_dir="$wallpapers_dir/.thumbnails"

mkdir -p "$thumbnails_dir"

rofi_cmd() {
    rofi -dmenu \
        -theme ~/.config/rofi/launcher/style.rasi
}

find "$wallpapers_dir" -maxdepth 1 -type f -printf "%f\n" | while read -r filename; do
    name="${filename%.*}"
    thumbnail="$thumbnails_dir/${name}.png"

    if [[ ! -f "$thumbnail" ]]; then
        convert "$wallpapers_dir/$filename" -resize 48x48 "$thumbnail" 2>/dev/null
    fi

    echo -e "$filename\0icon\x1f$thumbnail"
done | rofi_cmd | xargs -I {} feh --bg-scale "$wallpapers_dir/{}"
