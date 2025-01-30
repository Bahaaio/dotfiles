return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = { "DiffviewOpen" },

  vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<Cr>", { desc = "diff view" }),
}
