local backdrops = require('utils.backdrops')
local wezterm = require('wezterm')

return {
   -- perfomance & rendering
   max_fps = 120,
   front_end = 'WebGpu',
   underline_thickness = '1.5pt',
   webgpu_power_preference = 'HighPerformance',

   -- color scheme
   color_scheme = 'Catppuccin Mocha',

   -- background
   -- set to true to start on focus mode
   background = backdrops:initial_options(true),

   -- font
   font_size = 18,
   font = wezterm.font({ family = 'JetBrainsMono Nerd Font', weight = 'Bold' }),

   -- tab bar
   enable_tab_bar = false,
   window_decorations = 'RESIZE',

   -- window
   window_close_confirmation = 'NeverPrompt',
   adjust_window_size_when_changing_font_size = false,
   inactive_pane_hsb = { saturation = 1, brightness = 1 },
   window_padding = { left = 0, right = 0, top = 0, bottom = 0 },

   -- cursor
   animation_fps = 1,
   cursor_blink_rate = 0,
   cursor_blink_ease_in = 'Constant',
   cursor_blink_ease_out = 'Constant',
}
