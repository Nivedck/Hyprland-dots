-----------------------
---- KEYBINDINGS ----
-----------------------
local mainMod = "SUPER"

-- Launchers / apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))

-- Noctalia launcher
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")
)

-- Session / window actions
hl.bind(mainMod .. " + U", hl.dsp.window.kill())

hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("noctalia msg session lock")
)

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.fullscreen_state({
        internal = 0,
        client = 2,
    })
)

hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/battery.sh")
)

hl.bind(
    mainMod .. " + I",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/perfomance.sh")
)

-- Exit Hyprland
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exit())

-- Noctalia window switcher
hl.bind(
    "ALT + TAB",
    hl.dsp.exec_cmd("noctalia msg window-switcher")
)

-- Noctalia UI
hl.bind(
    mainMod .. " + C",
    hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")
)

hl.bind(
    mainMod .. " + S",
    hl.dsp.exec_cmd("noctalia msg settings-toggle")
)

hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications")
)

hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd("noctalia msg theme-mode-toggle")
)

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("noctalia msg panel-toggle control-center media")
)

hl.bind(
    mainMod .. " + W",
    hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper")
)

hl.bind(
    mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd(
        "noctalia msg panel-toggle noctalia/wallhaven\\:browser"
    )
)

hl.bind(
    mainMod .. " + SHIFT + C",
    hl.dsp.exec_cmd("noctalia msg caffeine-toggle")
)

hl.bind(
    mainMod .. " + D",
    hl.dsp.exec_cmd("noctalia msg notification-dnd-toggle")
)

-- Dock
hl.bind(
    mainMod .. " + SHIFT + D",
    hl.dsp.exec_cmd("noctalia msg dock-toggle")
)

-- Clipboard
hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard")
)

hl.bind(
    mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("noctalia msg clipboard-clear")
)

-- Noctalia system panel
hl.bind(
    mainMod .. " + SHIFT + Y",
    hl.dsp.exec_cmd("noctalia msg panel-toggle control-center system")
)

-- Screenshots
hl.bind(
    "Print",
    hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("noctalia msg screenshot-region")
)

-- Focus movement
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "d" }))

-- Workspaces: switch / move
for i = 1, 9 do
    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i })
    )
end

hl.bind(
    mainMod .. " + 0",
    hl.dsp.focus({ workspace = 10 })
)

hl.bind(
    mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({ workspace = 10 })
)

-- Workspaces: scroll
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Mouse move / resize
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Resize focused window
hl.bind(
    mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.resize({ x = -30, y = 0, relative = true })
)

hl.bind(
    mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.resize({ x = 30, y = 0, relative = true })
)

hl.bind(
    mainMod .. " + SHIFT + UP",
    hl.dsp.window.resize({ x = 0, y = -30, relative = true })
)

hl.bind(
    mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.resize({ x = 0, y = 30, relative = true })
)

-- Volume
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("noctalia msg volume-up"),
    { repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("noctalia msg volume-down"),
    { repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("noctalia msg volume-mute"),
    { locked = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("noctalia msg mic-mute"),
    { locked = true }
)

-- Media
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("noctalia msg media next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("noctalia msg media toggle"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("noctalia msg media toggle"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("noctalia msg media previous"),
    { locked = true }
)

-- Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("noctalia msg brightness-up"),
    { repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("noctalia msg brightness-down"),
    { repeating = true }
)