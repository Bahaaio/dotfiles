hl.config({
	-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
	input = {
		kb_layout = "us, ara",
		kb_variant = "",
		kb_model = "",

		-- swap esc and capslock, and use rctrl to switch layout
		kb_options = "caps:swapescape,grp:rctrl_toggle",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		repeat_rate = 35,
		repeat_delay = 200,

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#touchpad
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.4,
		},
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
	misc = {
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
	},
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "fullscreen" })
