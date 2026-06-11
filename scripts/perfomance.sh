#!/bin/bash

hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1"
hyprctl keyword animations:enabled true
hyprctl keyword decoration:blur:enabled true

notify-send "🔌 Performance Mode" "144Hz + animations ON"
