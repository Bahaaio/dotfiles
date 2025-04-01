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
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}
