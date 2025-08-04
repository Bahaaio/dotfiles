return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
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
          popup = {
            ["p"] = "PushPopup",
            ["P"] = "PullPopup",
          },
        },
      })
    end,
  },
}
