return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "switch window left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "switch window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "switch window up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "switch window right" },
    },
  },

  { "folke/persistence.nvim", enabled = false },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
    },
    keys = {
      { "<leader>p", "", desc = "session" },
      { "<leader>pa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
      { "<leader>ps", "<cmd>SessionSearch<cr>", desc = "Select session" },
      { "<leader>pS", "<cmd>SessionSave<cr>", desc = "Save session" },
      { "<leader>pr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
      { "<leader>pd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
    },
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    lazy = false,
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    enabled = false,
    opts = {
      maxkeys = 5,
    },
  },
}
