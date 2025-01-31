-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tokyodark",

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
    -- transparency = true,
}

M.nvdash = { load_on_startup = true }
M.ui = {
    tabufline = {
        lazyload = false,
    },
}

-- transparency toggle keymap
vim.keymap.set("n", "<leader>tt", function()
    require("base46").toggle_transparency()
end, { desc = "toggle nvim transparency" })

return M
