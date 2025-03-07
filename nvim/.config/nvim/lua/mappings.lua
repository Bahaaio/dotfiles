require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- default keymaps override
-- map("n", "<C-d>", "<C-d>zz", { desc = "half page down" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "half page up" })
map("n", "n", "nzz", { desc = "next search result" })
map("n", "N", "Nzz", { desc = "previous search result" })
map("n", "G", "Gzz", { desc = "last line" })

-- quit
map("n", "<leader>q", "<cmd>q<Cr>", { desc = "quit buffer" })
map("n", "<leader>Q", "<cmd>qa<Cr>", { desc = "quit all" })

-- terminal
map("n", "<leader>ft", "<cmd>ToggleTerm direction=float<Cr>", { desc = "toggle floating terminal" })
map("n", "<leader>v", "<cmd>vsp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new vertical terminal" })
map("n", "<leader>h", "<cmd>sp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new horizontal terminal" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h") -- move out of vertical terminal
map("t", "<C-k>", "<C-\\><C-N><C-w>k") -- move out of horizontal terminal

-- Telescope
map("n", "<leader>tr", "<cmd>Telescope resume<Cr>", { desc = "telescope resume" })
map("n", "<leader>fs", "<cmd>Telescope session-lens<Cr>", { desc = "telescope find session" })
nomap("n", "<leader>fz")
map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<Cr>", { desc = "telescope find in current buffer" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<Cr>", { desc = "open Lazy" })

-- Gitsigns
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<Cr>", { desc = "Gitsigns diff" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<Cr>", { desc = "Gitsigns preview hunk" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<Cr>", { desc = "Close current split" }) -- close current split window

map("n", "<C-CR>", "<C-]>zz", { noremap = true, silent = true })

-- tabufline
map("n", "<C-]>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<C-[>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

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

-- yank to the system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to the system clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "yank eol to the system clipboard" })

-- open current file in apostrophe
map("n", "<leader>mp", function()
  local file = vim.fn.expand "%:p" -- Get current file path
  if file ~= "" then
    vim.fn.jobstart("apostrophe " .. vim.fn.shellescape(file), { detach = true })
  else
    print "No file open"
  end
end, { desc = "preview markdown in apostrophe" })

vim.g.VM_maps = {
  ["Find Under"] = "<A-j>",
  ["Find Subword Under"] = "<A-j>",
  ["Select Cursor Up"] = "<A-C-k>",
  ["Select Cursor Down"] = "<A-C-j>",
}

-- toggle transparency
vim.keymap.set("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "toggle nvim transparency" })

-- dismiss noice notifications
vim.keymap.set("n", "<leader>n", "<cmd>Noice dismiss<Cr>", { desc = "dismiss notifications" })
