-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Noctalia color/theme integration
require("noctalia").apply_theme()

-- General / appearance / layout

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 6,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 12,
        rounding_power = 2,
        active_opacity = 0.85,
        inactive_opacity = 0.70,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 2,
            passes = 5,
            vibrancy = 0,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
        vrr = 2,
    },
})