-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- default keymaps override
map("n", "n", "nzz", { desc = "next search result" })
map("n", "N", "Nzz", { desc = "previous search result" })

-- Insert movement
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Telescope
map("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<Cr>", { desc = "Find in current buffer" })

-- snacks picker override
map("n", "<leader>ff", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
map("n", "<leader>fF", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

map("n", "<leader>sg", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
map("n", "<leader>sG", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })

map({ "n", "x" }, "<leader>sw", LazyVim.pick("grep_word"), { desc = "Visual selection or word (cwd)" })
map({ "n", "x" }, "<leader>sW", LazyVim.pick("grep_word"), { desc = "Visual selection or word (Root Dir)" })

map("n", "<leader>e", "<leader>fE", { desc = "Explorer Snacks (cwd)", remap = true })
map("n", "<leader>E", "<leader>fe", { desc = "Explorer Snacks (root dir)", remap = true })

map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

map(
  "n",
  "<leader>xx",
  "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" }
)
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Diagnostics (Trouble)" })

-- tab management
map("n", "<leader>to", "<cmd>tabnew<Cr>", { desc = "open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<Cr>", { desc = "close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<Cr>", { desc = "go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<Cr>", { desc = "go to previous tab" }) --  go to previous tab

-- formatting
map({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostics
map("n", "xn", "]d", { desc = "Next Diagnostic", remap = true })
map("n", "xp", "[d", { desc = "Prev Diagnostic", remap = true })

-- Commenting
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

-- vim-visual-multi
vim.g.VM_maps = {
  ["Remove Region"] = "<C-p>",
  ["Select Cursor Up"] = "<C-k>",
  ["Select Cursor Down"] = "<C-j>",
}
vim.g.VM_theme = "paper"
