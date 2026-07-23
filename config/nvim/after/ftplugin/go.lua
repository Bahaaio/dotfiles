vim.keymap.set("n", "<localleader>r", function()
  vim.cmd("write")

  Snacks.terminal("go run .", {
    win = {
      border = "rounded",
      height = 0.75,
      width = 0.8,
    },
    auto_close = false,
  })
end, { noremap = true, silent = true, desc = "Run golang project" })
