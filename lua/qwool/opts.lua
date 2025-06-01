local o = vim.o

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.showmode = false
o.termguicolors = true
vim.opt.shortmess:append("A")

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.autoindent = true
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"

o.updatetime = 250
o.timeoutlen = 1000 -- im getting old
o.clipboard = "unnamedplus"
vim.g.snacks_animate = false
