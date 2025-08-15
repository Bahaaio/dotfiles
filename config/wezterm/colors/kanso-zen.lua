-- Based on the beautiful kanso.nvim https://github.com/webhooked/kanso.nvim
local kanso_zen = {
   -- Backgrounds
   zenBg0 = '#090E13',
   zenBg3 = '#393B44',

   -- Main Colors
   red = '#C34043',
   red2 = '#E46876',
   yellow = '#DCA561',
   yellow2 = '#E6C384',
   green = '#98BB6C',
   green2 = '#87a987',
   green5 = '#7AA89F',
   blue = '#7FB4CA',
   blue3 = '#8ba4b0',
   violet = '#938AA9',
   violet2 = '#8992a7',
   aqua = '#8ea4a2',

   -- Foreground
   fg = '#C5C9C7',
   fg2 = '#f2f1ef',
   gray = '#717C7C',
}

local colorscheme = {
   foreground = kanso_zen.fg,
   background = kanso_zen.zenBg0,
   cursor_bg = kanso_zen.fg,
   cursor_border = kanso_zen.fg,
   cursor_fg = kanso_zen.zenBg0,
   selection_bg = kanso_zen.zenBg3,
   selection_fg = kanso_zen.fg,
   ansi = {
      kanso_zen.zenBg0,
      kanso_zen.red,
      kanso_zen.green,
      kanso_zen.yellow,
      kanso_zen.blue,
      kanso_zen.violet,
      kanso_zen.aqua,
      kanso_zen.fg,
   },
   brights = {
      kanso_zen.gray,
      kanso_zen.red2,
      kanso_zen.green2,
      kanso_zen.yellow2,
      kanso_zen.blue3,
      kanso_zen.violet2,
      kanso_zen.green5,
      kanso_zen.fg2,
   },
}

return colorscheme
