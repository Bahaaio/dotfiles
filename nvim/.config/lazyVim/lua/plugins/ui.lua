return {
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
    "nvim-lualine/lualine.nvim",
    opts = function()
      local opts = {
        sections = {
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%I:%M %p")
            end,
          },
        },
      }
      return opts
    end,
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
