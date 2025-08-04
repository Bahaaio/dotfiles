return {
  {
    "nvim-neotest/neotest",
    dependencies = { "alfaix/neotest-gtest" },
    opts = {
      adapters = {
        "neotest-gtest",
        "neotest-java",
      },
    },
    keys = {
      -- stylua: ignore
      { "<leader>tt", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
      -- stylua: ignore
      { "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    },
  },
}
