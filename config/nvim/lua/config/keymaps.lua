--
-- ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
-- ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
--

local map = vim.keymap.set
local unmap = vim.keymap.del

-- default keymaps override
map("n", "n", "nzz", { desc = "next search result" })
map("n", "N", "Nzz", { desc = "previous search result" })
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })
unmap("n", "<leader>qq")

-- misc
map("n", "<leader>\\", "<C-w>v", { desc = "Split window right" })

-- Insert movement
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-a>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })

-- LazyVim
map("n", "<leader>sg", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
map("n", "<leader>sG", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
map("n", "<leader>ff", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
map("n", "<leader>fF", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

-- floating terminal
map({ "n", "t" }, "<M-'>", "<cmd>ToggleTerm direction=float<Cr>", { desc = "toggle floating terminal" })
-- stylua: ignore
map("n", "<c-_>", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- map("t", "<C-x>", "<c-\\><c-n>", {})

-- Commenting
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- yanking
map({ "n", "x" }, "y", '"+y')
map("n", "Y", '"+y$', { desc = "yank eol" })
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "yank file" })
