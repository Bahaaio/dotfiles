local wezterm = require("wezterm")
local action = wezterm.action

local mod = {
	NONE  = "NONE",
	SHIFT = "SHIFT",
	ALT   = "ALT",
	CTRL  = "CTRL",
}

return {
	disable_default_key_bindings = true,
	keys = {
		-- resize font
		{ key = "=", mods = mod.CTRL, action = action.IncreaseFontSize },
		{ key = "-", mods = mod.CTRL, action = action.DecreaseFontSize },

		-- misc
		{ key = "F11", mods = mod.NONE, action = action.ToggleFullScreen },
		{ key = "F12", mods = mod.NONE, action = action.ShowDebugOverlay },

		-- open url
		{
			key = "O", mods = mod.ALT,
			action = wezterm.action.QuickSelectArgs({
				label = "open url",
				patterns = {
					"\\((https?://\\S+)\\)", "\\[(https?://\\S+)\\]",
					"\\{(https?://\\S+)\\}", "<(https?://\\S+)>",
					"\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.open_with(url)
				end),
			}),
		},

		-- copy/paste
		{ key = "C", mods = mod.CTRL, action = action.CopyTo("Clipboard") },
		{ key = "V", mods = mod.CTRL, action = action.PasteFrom("Clipboard") },
		{ key = "Insert", mods = mod.SHIFT, action = action.PasteFrom("Clipboard") },

		-- toggle transparency
		{
			key = "o", mods = mod.ALT,
			action = wezterm.action_callback(function(window, _)
				local blur_opacity = 0.85
				local overrides = window:get_config_overrides() or {}

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
