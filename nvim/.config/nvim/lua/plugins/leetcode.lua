local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  version = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  opts = {
    arg = leet_arg,
    lang = "cpp",
    storage = { home = "~/code/competetive/leetcode/" },
    picker = { provider = "telescope" },
    injector = {
      ["cpp"] = {
        imports = function()
          return {
            "#include <bits/stdc++.h>",
            "using namespace std;",
          }
        end,
      },
    },
  },
  keys = {
    { "<leader>'", "", desc = "Leetcode" },
    { "<leader>'t", "<cmd>Leet test<cr>", desc = "Test problem" },
    { "<leader>'s", "<cmd>Leet submit<cr>", desc = "Submit problem" },
    { "<leader>'c", "<cmd>Leet console<cr>", desc = "Open console" },
    { "<leader>'i", "<cmd>Leet info<cr>", desc = "Problem Info" },
    { "<leader>'l", "<cmd>Leet list<cr>", desc = "List Problems" },
    { "<leader>'d", "<cmd>Leet daily<cr>", desc = "Daily problem" },
  },
}
