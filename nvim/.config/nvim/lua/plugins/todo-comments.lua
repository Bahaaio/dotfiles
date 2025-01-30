return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},

    config = function()
        require("todo-comments").setup()
    end,
    -- keymaps
    vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<Cr>", { desc = "telescope todo comments" }),
    vim.keymap.set("n", "<leader>tl", "<cmd>TodoTrouble toggle focus=true<Cr>", { desc = "todo trouble list" }),
}
