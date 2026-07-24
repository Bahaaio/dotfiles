return {
  {
    "mikavilpas/yazi.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = "Yazi",
    opts = {
      open_for_directories = true,
      highlight_hovered_buffers_in_same_directory = false,
      keymaps = { cycle_open_buffers = false },
      integrations = { grep_in_directory = "snacks.picker" },
      yazi_floating_window_border = "rounded",
    },
    keys = {
      { "<leader>e", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi" },
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open yazi (Root dir)" },
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
      require("yazi.plugin").build_plugin(plugin, { sub_dir = "git.yazi" })
      require("yazi.plugin").build_plugin(plugin, { sub_dir = "chmod.yazi" })
      require("yazi.plugin").build_plugin(plugin, { sub_dir = "full-border.yazi" })
    end,
  },
}
