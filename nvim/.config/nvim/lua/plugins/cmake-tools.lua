return {
  "Civitasv/cmake-tools.nvim",
  lazy = true,

  ft = { "cpp", "h", "hpp", "cmake" },
  -- keymaps
  vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<Cr>", { desc = "cmake generate" }),
  vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<Cr>", { desc = "cmake build" }),
  vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<Cr>", { desc = "cmake run" }),
  vim.keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildType<Cr>", { desc = "cmake select build type" }),
}
