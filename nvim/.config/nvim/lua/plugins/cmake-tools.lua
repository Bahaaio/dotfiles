return {
  "Civitasv/cmake-tools.nvim",
  lazy = true,
  ft = { "cpp", "h", "hpp", "cmake" },

  config = function()
    require("cmake-tools").setup {
      cmake_runner = { -- runner to use
        name = "toggleterm", -- name of the runner
        opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = { -- a list of default and possible values for runners
          terminal = {
            split_size = 25,

            -- Running Tasks
            start_insert = true, -- If you want to enter terminal with :startinsert upon using :CMakeRun
            focus = true, -- Focus on terminal when cmake task is launched.
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = false },
        executor = { enabled = true },
      },
    }
  end,

  -- keymaps
  vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<Cr>", { desc = "cmake generate" }),
  vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<Cr>", { desc = "cmake build" }),
  vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<Cr>", { desc = "cmake run" }),
  vim.keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildType<Cr>", { desc = "cmake select build type" }),
}
