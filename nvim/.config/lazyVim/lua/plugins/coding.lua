return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
      },
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    lazy = true,
    ft = { "c", "cpp", "h", "hpp", "cmake" },
    keys = {
      { "<leader>mg", "<cmd>CMakeGenerate<Cr>", desc = "CMake generate" },
      { "<leader>mb", "<cmd>CMakeBuild<Cr>", desc = "CMake build" },
      { "<leader>mr", "<cmd>CMakeRun<Cr>", desc = "CMake run" },
      { "<leader>ms", "<cmd>CMakeSelectBuildType<Cr>", desc = "CMake select build type" },
    },
    config = function()
      require("cmake-tools").setup({
        cmake_runner = { -- runner to use
          name = "toggleterm", -- name of the runner
          default_opts = {
            terminal = {
              split_size = 25,
              -- Running Tasks
              start_insert = true,
              focus = true, -- Focus on terminal when cmake task is launched.
            },
          },
        },
        cmake_notifications = {
          runner = { enabled = false },
          executor = { enabled = true },
        },
      })
    end,
  },
}
