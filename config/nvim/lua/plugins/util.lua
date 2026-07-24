return {
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
    "mrjones2014/smart-splits.nvim",
    keys = function()
      local smart_splits = require("smart-splits")

      return {
        -- resizing splits
        { "<A-h>", smart_splits.resize_left, desc = "resize pane left" },
        { "<A-j>", smart_splits.resize_down, desc = "resize pane down" },
        { "<A-k>", smart_splits.resize_up, desc = "resize pane up" },
        { "<A-l>", smart_splits.resize_right, desc = "resize pane right" },

        -- moving between splits,
        { "<C-h>", smart_splits.move_cursor_left, desc = "switch window left" },
        { "<C-j>", smart_splits.move_cursor_down, desc = "switch window down" },
        { "<C-k>", smart_splits.move_cursor_up, desc = "switch window up" },
        { "<C-l>", smart_splits.move_cursor_right, desc = "switch window right" },
      }
    end,
  },
}
