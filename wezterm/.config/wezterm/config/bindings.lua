local wezterm = require('wezterm')
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {
   SUPER = 'ALT',
   SUPER_REV = 'ALT|CTRL',
   CTRL = 'CTRL',
   SHIFT = 'SHIFT',
   NONE = 'NONE',
}

-- wezterm.nvim: neovim-wezterm integration
local function split_nav(resize_or_move, key)
   local function is_vim(pane)
      -- this is set by the plugin, and unset on ExitPre in Neovim
      return pane:get_user_vars().IS_NVIM == 'true'
   end

   local direction_keys = {
      h = 'Left',
      j = 'Down',
      k = 'Up',
      l = 'Right',
   }

   return {
      key = key,
      mods = resize_or_move == 'resize' and 'META' or 'CTRL',
      action = wezterm.action_callback(function(win, pane)
         if is_vim(pane) then
            -- pass the keys through to vim/nvim
            win:perform_action({
               SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
            }, pane)
         else
            if resize_or_move == 'resize' then
               win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
            else
               win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
         end
      end),
   }
end

local keys = {
   -- font: resize font
   { key = '=', mods = mod.CTRL, action = act.IncreaseFontSize },
   { key = '-', mods = mod.CTRL, action = act.DecreaseFontSize },

   -- misc/useful --
   { key = 'v', mods = mod.SUPER, action = 'ActivateCopyMode' },
   { key = 'F11', mods = mod.NONE, action = act.ToggleFullScreen },
   { key = 'F12', mods = mod.NONE, action = act.ShowDebugOverlay },
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
   { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
   { key = 'Insert', mods = mod.SHIFT, action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 'n', mods = mod.SUPER, action = act.SpawnTab('DefaultDomain') },
   { key = 'w', mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[', mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
   { key = ']', mods = mod.SUPER, action = act.ActivateTabRelative(1) },
   { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
   { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

   -- tab: title
   {
      key = '0',
      mods = mod.SUPER,
      action = act.EmitEvent('tabs.manual-update-tab-title'),
   },
   { key = '0', mods = mod.SUPER_REV, action = act.EmitEvent('tabs.reset-tab-title') },

   -- tab: hide tab-bar
   { key = '9', mods = mod.SUPER, action = act.EmitEvent('tabs.toggle-tab-bar') },

   -- background controls --
   {
      key = [[/]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:random(window)
      end),
   },
   {
      key = [[,]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = [[.]],
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = 'b',
      mods = mod.SUPER,
      action = wezterm.action_callback(function(window, _pane)
         backdrops:toggle_focus(window)
      end),
   },

   -- panes --
   -- panes: split panes
   {
      key = [[\]],
      mods = mod.SUPER_REV,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[\]],
      mods = mod.CTRL,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },

   -- panes: zoom+close pane
   { key = 'Enter', mods = mod.SUPER, action = act.TogglePaneZoomState },
   { key = 'w', mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: resizing (SUPER)
   split_nav('resize', 'h'),
   split_nav('resize', 'j'),
   split_nav('resize', 'k'),
   split_nav('resize', 'l'),

   -- panes: navigation (CTRL)
   split_nav('move', 'h'),
   split_nav('move', 'j'),
   split_nav('move', 'k'),
   split_nav('move', 'l'),
   {
      key = 'p',
      mods = mod.SUPER,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },

   -- panes: scroll pane
   { key = 'u', mods = mod.SUPER, action = act.ScrollByLine(-5) },
   { key = 'd', mods = mod.SUPER, action = act.ScrollByLine(5) },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = mod.CTRL,
      action = act.OpenLinkAtMouseCursor,
   },
}

return {
   disable_default_key_bindings = true,
   disable_default_mouse_bindings = true,
   leader = { key = 'Space', mods = mod.SUPER_REV },
   keys = keys,
   key_tables = {},
   mouse_bindings = mouse_bindings,
}
