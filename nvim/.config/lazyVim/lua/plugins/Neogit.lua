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
    cmd = "Neogit",

    config = function()
        require("neogit").setup({
            graph_style = "unicode",
            -- process_spinner = true,
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
        })
    end,

    -- keymaps
    vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<Cr>", { desc = "Neogit" }),
    vim.keymap.set("n", "<leader>gc", "<cmd>NeogitCommit<Cr>", { desc = "Neogit commit" }),
}
