return {
  {
    "sphamba/smear-cursor.nvim",
    event = "BufEnter",
    enabled = false,
    cond = vim.g.neovide == nil,
    opts = {
      -- cursor_color = "none",
      stiffness = 1,
      legacy_computing_symbols_support = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    enabled = false,
  },

  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },

  {
    "echasnovski/mini.animate",
    version = "*",
    event = "BufEnter",
    -- enabled = false,
    config = function()
      require("mini.animate").setup {
        cursor = { enable = false },
        resize = {
          timing = require("mini.animate").gen_timing.linear { duration = 50, unit = "total" },
        },
        scroll = {
          timing = require("mini.animate").gen_timing.linear { duration = 150, unit = "total" },
        },
      }
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufEnter",
    config = function()
      require("mini.indentscope").setup {
        symbol = "│",
        options = { try_as_border = true },
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "Trouble",
            "Nvdash",
            "fzf",
            "help",
            "lazy",
            "mason",
            "NvimTree",
            "notify",
            "toggleterm",
            "trouble",
            "neogit",
            "NeogitStatus",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        }),
      }
    end,
  },
}
