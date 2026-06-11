#!/bin/bash

hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"
hyprctl keyword animations:enabled false
hyprctl keyword decoration:blur:enabled false

notify-send "🔋 Battery Mode" "60Hz + animations OFF"
