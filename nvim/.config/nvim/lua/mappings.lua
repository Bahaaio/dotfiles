require "nvchad.mappings"

local map = vim.keymap.set

-- default keymaps override
map("n", "<C-d>", "<C-d>zz", { desc = "half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "half page up" })

map("n", "n", "nzz", { desc = "next search result" })
map("n", "N", "Nzz", { desc = "previous search result" })

map("n", "<leader>q", "<cmd>q<Cr>", { desc = "quit buffer" })

-- terminal
map("n", "<leader>ft", "<cmd>ToggleTerm direction=float<Cr>", { desc = "toggle floating terminal" })
map("n", "<leader>v", "<cmd>vsp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new vertical terminal" })
map("n", "<leader>h", "<cmd>sp<Cr> <BAR> <cmd>term<Cr>i", { desc = "new horizontal terminal" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h") -- move out of vertical terminal
map("t", "<C-k>", "<C-\\><C-N><C-w>k") -- move out of horizontal terminal

-- Telescope
map("n", "<leader>tr", "<cmd>Telescope resume<Cr>", { desc = "telescope resume" })

-- Gitsigns
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<Cr>", { desc = "Gitsigns diff" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<Cr>", { desc = "Gitsigns preview hunk" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<Cr>", { desc = "Close current split" }) -- close current split window

-- tab management
map("n", "<leader>to", "<cmd>tabnew<Cr>", { desc = "open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<Cr>", { desc = "close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<Cr>", { desc = "go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<Cr>", { desc = "go to previous tab" }) --  go to previous tab
