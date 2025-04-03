return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<Cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup({
        graph_style = "unicode",
        process_spinner = true,
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "→", "↓" },
          section = { "→", "↓" },
        },
        mappings = {
          status = {
            ["o"] = "Toggle",
            ["R"] = "OpenTree",
            ["<tab>"] = false,
          },
        },
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<Cr>", desc = "Git Diff" },
    },
  },
}
