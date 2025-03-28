require "nvchad.options"

local opt = vim.o
opt.cursorlineopt = "both" -- to enable cursor-line!

opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false -- no wrapping
-- opt.spell = true -- spell checking

-- setting tab width to 4 spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- overriding nvchad's clipboard = "unnamedplus"
opt.clipboard = ""

-- vim.opt.scrolloff = 8 -- Keeps at least 8 lines above/below the cursor when scrolling
-- vim.opt.sidescrolloff = 8 -- Keeps at least 8 columns to the left/right of the cursor
