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

return {}
