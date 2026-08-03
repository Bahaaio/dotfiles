local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  opts = {
    arg = leet_arg,
    image_support = true,
    lang = "cpp",
    storage = { home = "~/code/competetive/leetcode/" },
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
    { "<localleader>", "", desc = "Leetcode" },
    { "<localleader>t", "<cmd>Leet test<cr>", desc = "Test problem" },
    { "<localleader>s", "<cmd>Leet submit<cr>", desc = "Submit problem" },
    { "<localleader>c", "<cmd>Leet console<cr>", desc = "Open console" },
    { "<localleader>i", "<cmd>Leet info<cr>", desc = "Problem Info" },
    { "<localleader>p", "<cmd>Leet list<cr>", desc = "List Problems" },
    { "<localleader>l", "<cmd>Leet lang<cr>", desc = "Choose Language" },
    { "<localleader>d", "<cmd>Leet desc<cr>", desc = "Toggle Description" },
    { "<localleader>D", "<cmd>Leet daily<cr>", desc = "Daily problem" },
  },
}
