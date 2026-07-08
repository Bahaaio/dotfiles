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
      yazi_floating_window_border = "none",
    },
  },

  {
    "yazi-rs/flavors",
    name = "catppuccin-mocha.yazi",
    lazy = true,
    build = function(spec)
      require("yazi.plugin").build_flavor(spec, { sub_dir = "catppuccin-mocha.yazi" })
    end,
  },

  {
    "yazi-rs/plugins",
    name = "plugins.yazi",
    lazy = true,
    build = function(plugin)
      require("yazi.plugin").build_plugin(plugin, { sub_dir = "chmod.yazi" })
      require("yazi.plugin").build_plugin(plugin, { sub_dir = "full-border.yazi" })
    end,
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
