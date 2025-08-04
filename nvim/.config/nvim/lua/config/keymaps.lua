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

-- floating terminal
map({ "n", "t" }, "<C-'>", "<cmd>ToggleTerm direction=float<Cr>", { desc = "toggle floating terminal" })
-- stylua: ignore
map("n", "<c-/>", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("t", "<C-x>", "<c-\\><c-n>", {})

-- tab management
map("n", "<leader>to", "<cmd>tabnew<Cr>", { desc = "open new tab" }) -- open new tab
map("n", "<leader>td", "<cmd>tabclose<Cr>", { desc = "close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<Cr>", { desc = "go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<Cr>", { desc = "go to previous tab" }) --  go to previous tab

-- Commenting
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- yanking
map({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to the system clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "yank eol to the system clipboard" })
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "yank file to the system clipboard" })
