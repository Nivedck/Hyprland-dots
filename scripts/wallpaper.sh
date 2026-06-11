#!/bin/bash

set -eo pipefail


wallpaper="${1:-}"
state_file="$HOME/.cache/last_wallpaper.txt"

if [[ -z "$wallpaper" ]]; then
    echo "Usage: $0 /path/to/wallpaper" >&2
    exit 2
fi

if [[ ! -f "$wallpaper" ]]; then
    echo "Wallpaper not found: $wallpaper" >&2
    exit 2
fi

# Basic validation to avoid saving/restoring a non-image file.
if command -v file >/dev/null 2>&1; then
    mime_type=$(file --brief --mime-type "$wallpaper" || true)
    if [[ "$mime_type" != image/* ]]; then
        echo "Not an image ($mime_type): $wallpaper" >&2
        exit 2
    fi
fi

set_ok=false

# Set wallpaper (try 'awww' first if present, then fall back to swww)
if command -v awww >/dev/null 2>&1; then
    if awww img "$wallpaper" --transition-type random; then
        set_ok=true
    fi
fi

if [[ "$set_ok" != true ]] && command -v swww >/dev/null 2>&1; then
    if ! pgrep -x swww-daemon >/dev/null 2>&1; then
        swww-daemon >/dev/null 2>&1 &
        disown || true
        sleep 0.1
    fi
    if swww img "$wallpaper" --transition-type random; then
        set_ok=true
    fi
fi

if [[ "$set_ok" != true ]]; then
    echo "Failed to set wallpaper (need a working 'awww' or 'swww')." >&2
    exit 1
fi

# Persist only after successfully setting the wallpaper
mkdir -p "$(dirname "$state_file")"
printf '%s\n' "$wallpaper" > "$state_file"

# Keep Waypaper's saved wallpaper aligned with the wallpaper chosen here.
waypaper_config="$HOME/.config/waypaper/config.ini"
if [[ -f "$waypaper_config" ]]; then
    waypaper_wallpaper="$wallpaper"
    if [[ "$waypaper_wallpaper" == "$HOME/"* ]]; then
        waypaper_wallpaper="~/${waypaper_wallpaper#"$HOME/"}"
    fi

    tmp_waypaper_config="$(mktemp)"
    awk -v wallpaper="$waypaper_wallpaper" '
        BEGIN { updated = 0 }
        /^wallpaper[[:space:]]*=/ {
            print "wallpaper = " wallpaper
            updated = 1
            next
        }
        { print }
        END {
            if (!updated) print "wallpaper = " wallpaper
        }
    ' "$waypaper_config" > "$tmp_waypaper_config" && mv "$tmp_waypaper_config" "$waypaper_config"
fi

# Generate blurred and resized version for hyprlock (best-effort)
if command -v convert >/dev/null 2>&1; then
    convert "$wallpaper" -resize 30% -blur 0x6 ~/.cache/blurred_wallpaper.png || true
fi

# Generate pywal colors (best-effort)
if command -v wal >/dev/null 2>&1; then
    wal -i "$wallpaper" || true
fi

# Load pywal colors
if [[ -f ~/.cache/wal/colors.sh ]]; then
    # NOTE: pywal-generated scripts may reference unset variables; avoid failing hard.
    set +u
    source ~/.cache/wal/colors.sh || true
fi

if [[ -n "${color0:-}" && -n "${color1:-}" && -n "${color2:-}" && -n "${color7:-}" ]]; then
    # Write Hyprland colors config
    cat <<EOF > ~/.config/hypr/colors.conf
general {
    col.active_border = rgb(${color2#"#"})
    col.inactive_border = rgb(${color0#"#"})
}
EOF

    # Write separate Hyprlock colors config
    cat <<EOF > ~/.config/hypr/hyprlock-colors.conf
# Hyprlock color variables
\$primary = rgb(${color2#"#"})           # Primary accent
\$on_primary = rgb(${color7#"#"})        # Text on primary
\$surface = rgb(${color0#"#"})           # Surface background
\$on_surface = rgb(${color7#"#"})        # Text on surface
\$error = rgb(${color1#"#"})             # Error
\$shadow = rgb(000000)                   # Shadow
EOF
fi

hyprctl reload >/dev/null 2>&1 || true

# Give Hyprland time to finish reload & re-register layer-shell


#hyprctl dispatch exec ~/.config/hypr/scripts/reload-quickshell.sh




# hyprctl reload
# #killall waybar && sleep 0.5 && waybar & 
# #~/.config/hypr/scripts/reload-quickshell.sh &
# hyprctl dispatch exec ~/.config/hypr/scripts/reload-quickshell.sh

