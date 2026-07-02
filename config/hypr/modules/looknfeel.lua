-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- TODO: extract colors

local active_border_color = "rgba(707985e6)"
local inactive_border_color = "rgba(595959aa)"

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		col = {
			active_border = active_border_color,
			inactive_border = inactive_border_color,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		-- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
		blur = {
			enabled = true,
			size = 12,
			passes = 2,
			contrast = 1.5,
		},
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#group
	group = {
		col = {
			border_active = active_border_color,
			border_inactive = inactive_border_color,
		},

		groupbar = {
			font_size = 14,
			font_weight_active = "ultraheavy",
			font_weight_inactive = "normal",

			indicator_height = 0,
			indicator_gap = 5,
			height = 20,
			gaps_in = 5,
			gaps_out = 0,

			-- TODO: extract colors
			text_color = "rgb(ffffff)",
			text_color_inactive = "rgba(ffffff90)",

			col = {
				active = "rgba(00000040)",
				inactive = "rgba(00000020)",
			},

			gradients = true,
			gradient_rounding = 0,
			gradient_round_only_edges = false,
		},
	},

	-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		focus_on_activate = true,
		anr_missed_pings = 3,
		on_focus_under_fullscreen = 1,
	},

	animations = { enabled = true },
})
