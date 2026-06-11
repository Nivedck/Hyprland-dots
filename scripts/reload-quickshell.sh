#!/bin/sh
pkill quickshell
sleep 0.2
QT_QPA_PLATFORM=wayland quickshell -p /home/nivedck/.config/quickshell/nived/bar-shell.qml &
