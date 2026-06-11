#!/bin/bash

set -euo pipefail

state_file="$HOME/.cache/last_wallpaper.txt"

if [[ -f "$state_file" ]]; then
    last_wallpaper=$(cat "$state_file" || true)
else
    last_wallpaper=""
fi

# On fresh login/reboot, wallpaper daemons can race compositor startup.
sleep 1

if [[ -n "$last_wallpaper" && -f "$last_wallpaper" ]]; then
    for _ in {1..5}; do
        if "$HOME/.config/hypr/scripts/wallpaper.sh" "$last_wallpaper"; then
            exit 0
        fi
        sleep 1
    done
fi

# If there is no cached wallpaper yet, leave the current background alone.
exit 0
