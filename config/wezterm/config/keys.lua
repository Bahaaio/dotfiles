local wezterm = require("wezterm")
local action = wezterm.action

local mod = {
   NONE       = 'NONE',
   CTRL       = 'CTRL',
   SUPER      = 'ALT',
   SHIFT      = 'SHIFT',
   SUPER_REV  = 'ALT|CTRL',
   CTRL_SHIFT = 'CTRL|SHIFT',
}

return {
	disable_default_key_bindings = true,
	keys = {
		-- font: resize font
		{ key = "=", mods = mod.CTRL, action = action.IncreaseFontSize },
		{ key = "-", mods = mod.CTRL, action = action.DecreaseFontSize },

		-- misc/useful --
		{ key = "v", mods = mod.SUPER, action = "ActivateCopyMode" },
		{ key = "F11", mods = mod.NONE, action = action.ToggleFullScreen },
		{ key = "F12", mods = mod.NONE, action = action.ShowDebugOverlay },
		{
			key = "u",
			mods = mod.SUPER_REV,
			action = wezterm.action.QuickSelectArgs({
				label = "open url",
				patterns = {
					"\\((https?://\\S+)\\)",
					"\\[(https?://\\S+)\\]",
					"\\{(https?://\\S+)\\}",
					"<(https?://\\S+)>",
					"\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.log_info("opening: " .. url)
					wezterm.open_with(url)
				end),
			}),
		},

		-- copy/paste --
		{ key = "c", mods = mod.CTRL_SHIFT, action = action.CopyTo("Clipboard") },
		{ key = "v", mods = mod.CTRL_SHIFT, action = action.PasteFrom("Clipboard") },
		{ key = "Insert", mods = mod.SHIFT, action = action.PasteFrom("Clipboard") },

		-- toggle transparency
		{
			key = "b",
			mods = mod.SUPER,
			action = wezterm.action_callback(function(window, _)
				local overrides = window:get_config_overrides() or {}

				if not overrides.window_background_opacity then
					overrides.window_background_opacity = 0.85
				else
					overrides.window_background_opacity = nil
				end

				window:set_config_overrides(overrides)
			end),
		},
	},
}
