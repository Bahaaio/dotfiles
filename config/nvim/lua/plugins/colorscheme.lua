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
    },
  },
}
