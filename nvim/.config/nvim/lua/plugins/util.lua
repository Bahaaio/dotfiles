return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = false,
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "switch window left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "switch window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "switch window up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "switch window right" },
    },
  },

  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = function()
      return {
        -- resizing splits
        { "<A-h>", require("smart-splits").resize_left, desc = "resize pane left" },
        { "<A-j>", require("smart-splits").resize_down, desc = "resize pane down" },
        { "<A-k>", require("smart-splits").resize_up, desc = "resize pane up" },
        { "<A-l>", require("smart-splits").resize_right, desc = "resize pane right" },
        -- moving between splits,
        { "<C-h>", require("smart-splits").move_cursor_left, desc = "switch window left" },
        { "<C-j>", require("smart-splits").move_cursor_down, desc = "switch window down" },
        { "<C-k>", require("smart-splits").move_cursor_up, desc = "switch window up" },
        { "<C-l>", require("smart-splits").move_cursor_right, desc = "switch window right" },
      }
    end,
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
