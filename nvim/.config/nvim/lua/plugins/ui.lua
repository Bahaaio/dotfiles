return {
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "BufEnter",
    -- enabled = false,
    config = function()
      require("mini.animate").setup({
        cursor = { enable = false },
        resize = {
          timing = require("mini.animate").gen_timing.linear({ duration = 50, unit = "total" }),
        },
        scroll = {
          timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
        },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = "VeryLazy",
    version = "*",
    opts = {},
    config = function()
      require("toggleterm").setup({
        float_opts = {
          border = "curved", -- Set the border to 'curved' for rounded corners
        },
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        hover = {
          enabled = true,
          reveal = { "close" },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗   ███████╗██╗  ██╗███████╗
████╗  ██║██║   ██║██║████╗ ████║   ██╔════╝╚██╗██╔╝██╔════╝
██╔██╗ ██║██║   ██║██║██╔████╔██║   █████╗   ╚███╔╝ █████╗  
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║   ██╔══╝   ██╔██╗ ██╔══╝  
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██╗███████╗██╔╝ ██╗███████╗
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
   ]],
        },
      },
    },
  },
}
