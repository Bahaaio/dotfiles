return {
  { "folke/persistence.nvim", enabled = false },

  {
    "rmagatti/auto-session",
    lazy = false,
    version = false,

    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
    },
    keys = {
      { "<leader>p", "", desc = "session" },
      { "<leader>pa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
      { "<leader>ps", "<cmd>AutoSession search<CR>", desc = "Select session" },
      { "<leader>pS", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>pr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
      { "<leader>pd", "<cmd>AutoSession delete<CR>", desc = "Delete session" },
    },
  },
}
