return {
  {
    "mg979/vim-visual-multi",
    keys = { "<C-n>" },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "folke/flash.nvim",
    keys = function()
      -- stylua: ignore
      return {
        { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
        { "<C-t>", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = "   ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
      },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      modes = {
        symbols = {
          focus = true,
        },
      },
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>cc", group = "CMake", icon = { icon = " ", color = "blue" } },
      },
    },
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
          ["h"] = "close_node",
          ["e"] = "rename_basename",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- on
        },
      },
      default_component_configs = {
        indent = {
          -- with_expanders = false,
        },
        name = {
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            unstaged = "",
            staged = "",
          },
        },
      },
    },
  },

  -- explorer (snacks picker)
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- hidden = true,
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
  },
}
