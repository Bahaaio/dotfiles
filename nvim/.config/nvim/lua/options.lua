require "nvchad.options"

local opt = vim.o
opt.cursorlineopt = "both" -- to enable cursor-line!

opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false -- no wrapping
-- opt.spell = true -- spell checking

-- setting tab width to 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4
