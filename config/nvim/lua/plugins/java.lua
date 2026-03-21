return {
  {
    "nvim-java/nvim-java",
    ft = { "java", "yaml", "jproperties" },
    config = function()
      require("java").setup()
      vim.lsp.enable("jdtls")
    end,
    keys = {
      { "<leader>j", group = "Java" },
      { "<leader>jp", "<cmd>JavaProfile<Cr>", desc = "profiles UI" },
      { "<leader>jr", "<cmd>JavaRunnerRunMain<Cr>", desc = "run main" },
      { "<leader>js", "<cmd>JavaRunnerStopMain<Cr>", desc = "stop main" },
      { "<leader>jl", "<cmd>JavaRunnerToggleLogs<Cr>", desc = "toggle logs" },
      { "<leader>jc", "<cmd>JavaBuildCleanWorkspace<Cr>", desc = "clean build" },
      { "<leader>jb", "<cmd>JavaBuildBuildWorkspace<Cr>", desc = "build workspace" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>j", group = "Java" },
      },
    },
  },
}
