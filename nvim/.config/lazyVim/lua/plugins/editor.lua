return {
  {
    "mg979/vim-visual-multi",
    keys = { "<C-n>" },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            win = {
              list = {
                keys = {
                  ["<BS>"] = "explorer_up",
                  ["o"] = "confirm",
                  ["O"] = "explorer_open", -- open with system application
                  ["P"] = "toggle_preview",
                  ["."] = "explorer_focus",
                },
              },
            },
          },
        },
      },
    },
  },
}
