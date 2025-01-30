return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        -- "ibhagwan/fzf-lua", -- optional
        -- "echasnovski/mini.pick", -- optional
    },
    config = true,
    cmd = "Neogit",

    -- keymaps
    vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<Cr>", { desc = "neogit" }),
    vim.keymap.set("n", "<leader>gc", "<cmd>NeogitCommit<Cr>", { desc = "neogit commit" }),
}
