return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-mocha" },
  },

  { "webhooked/kanso.nvim" },

  {
    "catppuccin",
    opts = {
      transparent_background = true,
      float = { transparent = true },
      integrations = {
        gitsigns = {
          enabled = true,
          transparent = false,
        },
      },
      custom_highlights = function(colors)
        return {
          FloatBorder = { fg = colors.surface0 },
          BlinkCmpMenuBorder = { fg = colors.surface0 },
        }
      end,
    },
  },
}
