-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- Keyring / polkit
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("/usr/bin/kwalletd6")

    -- Wallpaper
    -- hl.exec_cmd("~/.config/hypr/scripts/restore-wallpaper.sh")

    -- Tray / networking
    hl.exec_cmd("nm-applet")

    -- Noctalia
    hl.exec_cmd("noctalia")

    -- Idle
    -- hl.exec_cmd("hypridle -c ~/.config/hypr/hypridle.conf")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor WhiteSur-cursors 24")

    -- Clipboard history
    -- hl.exec_cmd("wl-paste --type text --watch cliphist store")
    -- hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Hyprland plugins
    -- hl.exec_cmd("hyprpm reload -n")
end)