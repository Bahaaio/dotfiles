return {
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "h", "hpp", "cmake" },
    opts = {
      cmake_runner = {
        default_opts = {
          terminal = {
            split_size = 25,
            start_insert = true,
            focus = true,
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = false },
        executor = { enabled = true },
      },
    },
    keys = {
      { "<leader>mg", "<cmd>CMakeGenerate<Cr>", desc = "CMake generate" },
      { "<leader>mb", "<cmd>CMakeBuild<Cr>", desc = "CMake build" },
      { "<leader>mr", "<cmd>CMakeRun<Cr>", desc = "CMake run" },
      { "<leader>mf", "<cmd>CMakeRunCurrentFile<Cr>", desc = "CMake run current file" },
      { "<leader>mt", "<cmd>CMakeRunTest<Cr>", desc = "CMake run test" },
      { "<leader>ms", "<cmd>CMakeSelectBuildType<Cr>", desc = "CMake select build type" },
      { "<leader>mc", "<cmd>CMakeClean<Cr>", desc = "CMake clean" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "CMake", icon = { icon = " ", color = "blue" } },
      },
    },
  },
}
