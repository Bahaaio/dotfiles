return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    opts = {
      graph_style = "unicode",
      process_spinner = true,
      signs = {
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
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<Cr>", desc = "Neogit" },
    },
  },
}
