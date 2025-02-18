return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  cmd = { "RenderMarkdown" },
  vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown<cr>", { desc = "render markdown" }),
}
