return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<CR>", desc = "Undotree toggle" },
    },
  },

  {
    "Wansmer/treesj",
    keys = {
      { "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false },
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          multi_line = false,
          highlight = { backdrop = false },
          char_actions = function()
            return {
              [";"] = "next", -- set to `right` to always go right
              [","] = "prev", -- set to `left` to always go left
            }
          end,
        },
      },
    },
    keys = function()
      -- stylua: ignore
      return {
        { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
        { "<C-t>", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "<C-k>", false, mode = "i" }, -- disable signature help in insert mode
            { "<M-Cr>", vim.lsp.buf.code_action, { desc = "Code Action" } },
          },
        },
      },
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
