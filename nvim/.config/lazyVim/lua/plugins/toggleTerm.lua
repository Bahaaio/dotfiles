return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    config = function()
        require("toggleterm").setup({
            float_opts = {
                border = "curved", -- Set the border to 'curved' for rounded corners
            },
        })
    end,
}
