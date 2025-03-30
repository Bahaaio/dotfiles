-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- default keymaps override
-- map("n", "<C-d>", "<C-d>zz", { desc = "half page down" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "half page up" })
map("n", "n", "nzz", { desc = "next search result" })
map("n", "N", "Nzz", { desc = "previous search result" })
map("n", "G", "Gzz", { desc = "last line" })

map({ "n", "v" }, "<leader>/", "gcc")

-- Insert movement
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- terminal
map("n", "<leader>ft", "<cmd>ToggleTerm direction=float<Cr>", { desc = "toggle floating terminal" })
map("n", "<leader>v", "<cmd>vsp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new vertical terminal" })
map("n", "<leader>h", "<cmd>sp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new horizontal terminal" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h") -- move out of vertical terminal
map("t", "<C-k>", "<C-\\><C-N><C-w>k") -- move out of horizontal terminal

-- -- Telescope
-- map("n", "<leader>tr", "<cmd>Telescope resume<Cr>", { desc = "telescope resume" })
-- map("n", "<leader>fs", "<cmd>Telescope session-lens<Cr>", { desc = "telescope find session" })
-- nomap("n", "<leader>fz")
-- map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<Cr>", { desc = "telescope find in current buffer" })

-- tab management
map("n", "<leader>to", "<cmd>tabnew<Cr>", { desc = "open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<Cr>", { desc = "close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<Cr>", { desc = "go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<Cr>", { desc = "go to previous tab" }) --  go to previous tab

-- vim-tmux-navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "switch window left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "switch window up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "switch window right" })

-- -- session restore
-- vim.keymap.set("n", "<leader>qS", function()
--     vim.cmd("BufferLineGroupClose ungrouped")
--     require("persistence").select()
-- end, { desc = "Select Session" })

-- formatting
map({ "n", "v" }, "<leader>fm", function()
    LazyVim.format({ force = true })
end, { desc = "Format" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- yank to the system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to the system clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "yank eol to the system clipboard" })
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "yank eol to the system clipboard" })

-- open current file in apostrophe
map("n", "<leader>mp", function()
    local file = vim.fn.expand("%:p") -- Get current file path
    if file ~= "" then
        vim.fn.jobstart("apostrophe " .. vim.fn.shellescape(file), { detach = true })
    else
        print("No file open")
    end
end, { desc = "preview markdown in apostrophe" })

vim.g.VM_maps = {
    ["Find Under"] = "<A-j>",
    ["Find Subword Under"] = "<A-j>",
    ["Select Cursor Up"] = "<A-C-k>",
    ["Select Cursor Down"] = "<A-C-j>",
}
