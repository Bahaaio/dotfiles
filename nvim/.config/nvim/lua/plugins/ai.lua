return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {
      suggestion = {
        -- enabled = true,
        -- hide_during_completion = vim.g.ai_cmp,
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
}
