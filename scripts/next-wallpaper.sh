#!/bin/bash

wallpaper_dir="$HOME/Pictures/Wallpapers"
state_file="$HOME/.cache/last_wallpaper.txt"

# Get all images sorted
wallpapers=($(find "$wallpaper_dir" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort))

# Get current wallpaper index
current_index=0
if [[ -f "$state_file" ]]; then
    last=$(cat "$state_file")
    for i in "${!wallpapers[@]}"; do
        if [[ "${wallpapers[$i]}" = "$last" ]]; then
            current_index=$(( (i + 1) % ${#wallpapers[@]} ))
            break
        fi
    done
fi

next="${wallpapers[$current_index]}"
echo "$next" > "$state_file"

# Call your main wallpaper script
~/.config/hypr/scripts/wallpaper.sh "$next"
