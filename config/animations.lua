-------------------
---- ANIMATIONS ----
-------------------

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", {
    type = "bezier",
    points = {
        { 0.05, 0.9 },
        { 0.1, 1.05 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5,
    bezier = "myBezier",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "default",
    style = "popin 80%",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})

hl.curve("workspaceSpring", {
    type = "spring",
    mass = 1,
    stiffness = 100,
    dampening = 15,
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    spring = "workspaceSpring",
    style = "slidevert",
})

-- hl.animation({
--     leaf = "workspaces",
--     enabled = true,
--     speed = 5,
--     bezier = "default",
--     style = "slidevert",
-- })

-- Force a strict 3-finger vertical swipe to navigate workspaces
hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

