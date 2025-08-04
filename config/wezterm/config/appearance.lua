local backdrops = require('utils.backdrops')

return {
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   underline_thickness = '1.5pt',

   -- cursor
   animation_fps = 1,
   cursor_blink_ease_in = 'Constant',
   cursor_blink_ease_out = 'Constant',
   default_cursor_style = 'SteadyBlock',
   cursor_blink_rate = 0,

   -- color scheme
   color_scheme = 'Catppuccin Mocha',

   -- background
   background = backdrops:initial_options(true), -- set to true if you want wezterm to start on focus mode

   -- tab bar
   hide_tab_bar_if_only_one_tab = true,
   use_fancy_tab_bar = false,
   tab_max_width = 23,
   show_tab_index_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,
   window_decorations = 'RESIZE',

   -- window
   window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
   adjust_window_size_when_changing_font_size = false,
   window_close_confirmation = 'NeverPrompt',
   inactive_pane_hsb = { saturation = 1, brightness = 1 },
}
