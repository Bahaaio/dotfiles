return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        float_opts = {
          border = "curved",
        },
      })
    end,
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
