return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup()
  end,
}
