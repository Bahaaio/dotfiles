return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>dl",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics list(Trouble)",
    },
    {
      "<leader>df",
      "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ds",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>dr",
      "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    --   {
    --     "<leader>xL",
    --     "<cmd>Trouble loclist toggle<cr>",
    --     desc = "Location List (Trouble)",
    --   },
    --   {
    --     "<leader>xQ",
    --     "<cmd>Trouble qflist toggle<cr>",
    --     desc = "Quickfix List (Trouble)",
    --   },
  },
}
