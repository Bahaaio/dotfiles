vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",

  callback = function()
    local go_term = require("toggleterm.terminal").Terminal:new({
      cmd = "go run .",
      close_on_exit = false,
      direction = "float",
    })

    vim.keymap.set("n", "<leader>r", function()
      vim.cmd("write")
      go_term:toggle()
    end, { buffer = true, noremap = true, silent = true, desc = "Run golang project" })
  end,
})

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    config = function()
      local neotest_golang_opts = {}
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(neotest_golang_opts), -- Registration
        },
      })
    end,
  },
}
