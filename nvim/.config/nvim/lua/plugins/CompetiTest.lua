return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  cmd = { "CompetiTest" },
  config = function()
    require("competitest").setup()
  end,
}
