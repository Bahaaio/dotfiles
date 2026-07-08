local wezterm = require("wezterm")
local action = wezterm.action

local mod = {
	SHIFT = "SHIFT",
	ALT = "ALT",
	CTRL = "CTRL",
}

return {
	disable_default_key_bindings = true,
	keys = {
		-- resize font
		{ key = "=", mods = mod.CTRL, action = action.IncreaseFontSize },
		{ key = "-", mods = mod.CTRL, action = action.DecreaseFontSize },

		-- misc
		{ key = "F11", action = action.ToggleFullScreen },
		{ key = "F12", action = action.ShowDebugOverlay },

		-- send shift+enter as CSI-u so that tmux can distinguish it from enter
		{ key = "Enter", mods = "SHIFT", action = action.SendString("\x1b[13;2u") },

		-- copy/paste
		{ key = "C", mods = mod.CTRL, action = action.CopyTo("Clipboard") },
		{ key = "V", mods = mod.CTRL, action = action.PasteFrom("Clipboard") },
		{ key = "Insert", mods = mod.SHIFT, action = action.PasteFrom("Clipboard") },

		-- quick select
		{ key = "Y", mods = mod.ALT, action = action.QuickSelect },

		{
			key = "O",
			mods = mod.ALT,
			action = action.QuickSelectArgs({
				label = "open url",
				patterns = { "https?://\\S+[^)\\]}>\"'.,;:!?\\s]" }, -- exclude trailing characters
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.open_with(url)
				end),
			}),
		},

		-- toggle transparency
		{
			key = "o",
			mods = mod.ALT,
			action = wezterm.action_callback(function(window, _)
				local blur_opacity = 0.85
				local overrides = window:get_config_overrides() or {}

				local inital_opacity = require("config.appearance").window_background_opacity
				if overrides.window_background_opacity == nil then
					overrides.window_background_opacity = inital_opacity
				end

				if overrides.window_background_opacity == blur_opacity then
					overrides.window_background_opacity = 1.0
				else
					overrides.window_background_opacity = blur_opacity
				end

				window:set_config_overrides(overrides)
			end),
		},
	},
}
