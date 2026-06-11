#!/bin/bash

WAL_COLORS="$HOME/.cache/wal/colors.sh"
source "$WAL_COLORS"

HYPR_CONF="$HOME/.config/hypr/colors.conf"

# Write Hyprland-compatible config
cat <<EOF > "$HYPR_CONF"
col.active_border = rgb(${color1#"#"})
col.inactive_border = rgb(${color0#"#"})
EOF
