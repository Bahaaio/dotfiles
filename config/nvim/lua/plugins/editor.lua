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
    opts = { use_default_keymaps = false },
    keys = {
      { "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      settings = { save_on_toggle = true },
    },
    keys = function()
      local harpoon = require("harpoon")

      return {
        { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu" },
        { "<leader>H", function() harpoon:list():add() end, desc = "Harpoon File" },

        { "<M-1>", function() harpoon:list():select(1) end, desc = "Harpoon to File 1" },
        { "<M-2>", function() harpoon:list():select(2) end, desc = "Harpoon to File 2" },
        { "<M-3>", function() harpoon:list():select(3) end, desc = "Harpoon to File 3" },
        { "<M-4>", function() harpoon:list():select(4) end, desc = "Harpoon to File 4" },
      }
    end,
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
      local flash = require("flash")

      return {
        { "m", mode = { "n", "x", "o" }, flash.jump, desc = "Flash" },
        { "<C-t>", mode = { "n", "o", "x" }, flash.treesitter, desc = "Flash Treesitter" },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    opts = { focus = true },
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
        sources = {
          grep = { hidden = true },
          files = {
            layout = { preview = false },
            hidden = true,
          },
          explorer = {
            hidden = true,
            win = {
              list = {
                keys = {
                  ["o"] = "confirm",
                  ["O"] = "explorer_open",
                },
              },
            },
          },
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
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
