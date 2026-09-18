return {
  {
    "folke/noice.nvim",
    opts = {
      -- silence hover not available
      lsp = { hover = { silent = true } },
      presets = { lsp_doc_border = true },
    },
  },

  {
    {
      "neovim/nvim-lspconfig",
      opts = {
        diagnostics = {
          float = { border = "rounded" },
        },
      },
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
        lualine_y = { "progress" },
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      styles = {
        terminal = {
          wo = { winbar = "" },
        },
      },
      image = {
        doc = {
          enabled = true,
          inline = false,
        },
      },
      dashboard = {
        preset = {
          header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]],
        },
      },
      keys = {
        -- cwd instead of root
        { key = "f", action = ":lua Snacks.dashboard.pick('files', { root = false })" },
      },
    },
  },
}
