return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
      -- "echasnovski/mini.pick", -- optional
    },
    cmd = "Neogit",

    config = function()
      require("neogit").setup {
        graph_style = "unicode",
        process_spinner = true,
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "→", "↓" },
          section = { "→", "↓" },
        },
        mappings = {
          status = {
            ["o"] = "Toggle",
            ["R"] = "OpenTree",
            ["<tab>"] = false,
          },
        },
      }
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,

    -- keymaps
    vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<Cr>", { desc = "neogit" }),
    vim.keymap.set("n", "<leader>gc", "<cmd>NeogitCommit<Cr>", { desc = "neogit commit" }),
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen" },

    vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<Cr>", { desc = "diff view" }),
  },
}
