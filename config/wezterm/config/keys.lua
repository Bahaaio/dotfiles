local wezterm = require('wezterm')
local backdrops = require('utils.backdrops')
local act = wezterm.action

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
      { key = '=', mods = mod.CTRL, action = act.IncreaseFontSize },
      { key = '-', mods = mod.CTRL, action = act.DecreaseFontSize },

      -- misc/useful --
      { key = 'v', mods = mod.SUPER, action = 'ActivateCopyMode' },
      { key = 'F11', mods = mod.NONE, action = act.ToggleFullScreen },
      { key = 'f', mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
      {
         key = 'u',
         mods = mod.SUPER_REV,
         action = wezterm.action.QuickSelectArgs({
            label = 'open url',
            patterns = {
               '\\((https?://\\S+)\\)',
               '\\[(https?://\\S+)\\]',
               '\\{(https?://\\S+)\\}',
               '<(https?://\\S+)>',
               '\\bhttps?://\\S+[)/a-zA-Z0-9-]+',
            },
            action = wezterm.action_callback(function(window, pane)
               local url = window:get_selection_text_for_pane(pane)
               wezterm.log_info('opening: ' .. url)
               wezterm.open_with(url)
            end),
         }),
      },

      -- copy/paste --
      { key = 'c', mods = mod.CTRL_SHIFT, action = act.CopyTo('Clipboard') },
      { key = 'v', mods = mod.CTRL_SHIFT, action = act.PasteFrom('Clipboard') },
      { key = 'Insert', mods = mod.SHIFT, action = act.PasteFrom('Clipboard') },

      -- background controls --
      {
         key = [[/]], mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _)
            backdrops:random(window)
         end),
      },
      {
         key = [[,]], mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _)
            backdrops:cycle_back(window)
         end),
      },
      {
         key = [[.]], mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _)
            backdrops:cycle_forward(window)
         end),
      },
      {
         key = 'b', mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _)
            backdrops:toggle_focus(window)
         end),
      },
   },
}
