return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "echasnovski/mini.ai",
    version = "*",
    event = "BufEnter",
    config = function()
      require("mini.ai").setup()
    end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },

  {
    "mg979/vim-visual-multi",
    keys = { "<A-j>" },
  },

  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    lazy = false,
    -- enabled = false,
  },
}
