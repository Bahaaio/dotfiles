-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- TODO: change hardcoded sizes to dynamic sizes

hl.window_rule({
	match = { class = "(localsend.*|.*copyq|.*pavucontrol|.*satty|btop)" },

	float = true,
	center = true,
	size = { 750, 600 },
})

hl.window_rule({ match = { class = "org.gnome.Calculator|float" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true, size = { 900, 600 } })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, float = true, size = { 900, 580 } })

-- workspace assignments
hl.window_rule({ match = { class = "Postman" }, workspace = 4 })
hl.window_rule({ match = { class = "ticktick" }, workspace = 5 })
hl.window_rule({ match = { class = "vesktop" }, workspace = 9 })
hl.window_rule({ match = { class = ".*zapzap" }, workspace = 10 })

-- disable screen sharing for zapzap
hl.window_rule({ match = { class = ".*zapzap" }, no_screen_share = true })

-- don't focus ticktick when open
hl.window_rule({ match = { class = "ticktick" }, suppress_event = "activatefocus" })

-- idle inhibit while watching videos
hl.window_rule({ match = { class = "^(mpv|.+exe|celluloid)$" }, idle_inhibit = "focus" })
hl.window_rule({ match = { class = "^(zen)$", title = "^(.*YouTube.*)$" }, idle_inhibit = "focus" })
hl.window_rule({ match = { class = "^(zen)$" }, idle_inhibit = "fullscreen" })

-- dim around dialogs
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, dim_around = true })
hl.window_rule({ match = { class = "polkit-gnome-authentication-agent-1" }, dim_around = true })
hl.window_rule({ match = { class = "zen", title = "^(File Upload)$" }, dim_around = true })

-- scroll sensitivity
hl.window_rule({ match = { class = "org.wezfurlong.wezterm" }, scroll_touchpad = 0.025 })

-- ignore maximize requests from all apps
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- fix xwayland popups
hl.window_rule({
	match = { xwayland = true, class = "win[0-9]+" },

	no_dim = true,
	no_shadow = true,
	no_blur = true,
	opaque = true,
	rounding = 10,
})

-- blur
hl.window_rule({
	match = { class = "zen|.*Nautilus|.*pavucontrol|vesktop|ticktick|.*zapzap|Postman", fullscreen = false },
	opacity = "0.9",
})

-- special workspaces
hl.window_rule({
	match = { class = "scratchpad" },

	float = true,
	size = { 1100, 800 },
	center = true,
	workspace = "special:scratchpad silent",
})

hl.window_rule({
	match = { class = "btop" },

	float = true,
	size = { 1261, 823 },
	center = true,
	workspace = "special:btop silent",
})
