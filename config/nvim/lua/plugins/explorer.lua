return {
  {
    "mikavilpas/yazi.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = "Yazi",
    keys = {
      { "<leader>e", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi" },
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open yazi (Root dir)" },
    },
    opts = {
      open_for_directories = true,
      keymaps = { cycle_open_buffers = false },
      integrations = { grep_in_directory = "snacks.picker" },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      explorer = { replace_netrw = false },
      picker = {
        reverse = false,
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
        sources = {
          files = {
            layout = { preview = false },
            hidden = true,
          },
          -- explorer
          explorer = {
            hidden = true,
            win = {
              list = {
                keys = {
                  ["o"] = "confirm",
                  ["O"] = "explorer_open", -- open with system application
                },
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
}
