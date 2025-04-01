-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- load session on enter
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
        if vim.fn.getcwd() ~= vim.env.HOME then
            require("persistence").load()
        end
    end,
    nested = true,
})
