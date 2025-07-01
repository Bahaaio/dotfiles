return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {
      suggestion = {
        -- enabled = true, hide_during_completion = vim.g.ai_cmp,
        -- keymap = { accept = "<tab>", next = "<C-]>", prev = "<C-[>", },
      },
    },
    keys = {
      { "<leader>ad", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>ae", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            kind = "Copilot",
            score_offset = -1,
            async = true,
          },
        },
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
      "j-hui/fidget.nvim",
    },
    opts = {},
    config = function()
      require("codecompanion").setup({
        strategies = {
          inline = {
            keymaps = {
              accept_change = {
                modes = { n = "<leader>ac" },
                description = "Accept the suggested change",
              },
              reject_change = {
                modes = { n = "<leader>ar" },
                description = "Reject the suggested change",
              },
            },
          },
        },
        extensions = {
          history = {
            enabled = true,
            opts = {
              -- Number of days after which chats are automatically deleted (0 to disable)
              expiration_days = 30,
              ---On exiting and entering neovim, loads the last chat on opening chat
              continue_last_chat = false,
              ---When chat is cleared with `gx` delete the chat from history
              delete_on_clearing_chat = true,
            },
          },
        },
      })

      -- progress indicator --

      local progress = require("fidget.progress")
      local handles = {}
      local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionRequestStarted",
        group = group,
        callback = function(e)
          handles[e.data.id] = progress.handle.create({
            title = "",
            message = "",
            lsp_client = { name = LazyVim.config.icons.kinds.Copilot .. e.data.adapter.formatted_name },
          })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "CodeCompanionRequestFinished",
        group = group,
        callback = function(e)
          local handle = handles[e.data.id]
          if handle then
            handle.message = e.data.status == ""
            handle:finish()
            handles[e.data.id] = nil
          end
        end,
      })
    end,
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<Cr>", desc = "Toggle Chat" },
      { "<leader>ap", "<cmd>CodeCompanionAction<Cr>", desc = "Action Palette" },
      { "<leader>ai", ":CodeCompanion ", desc = "Inline assistant", mode = "v" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline assistant", mode = "n" },
    },
  },
}
