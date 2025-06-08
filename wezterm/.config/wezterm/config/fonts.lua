local wezterm = require('wezterm')

local font_family = 'JetBrainsMono Nerd Font'

return {
   font = wezterm.font({
      family = font_family,
      weight = 'Bold',
   }),
   font_size = 14,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
