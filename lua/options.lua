local o = vim.o

o.termguicolors = true
-- o.background = "dark"
-- vim.cmd.colorscheme("base16-default-dark")
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.showmode = false
o.termguicolors = true
o.scrolloff = 5
vim.opt.shortmess:append("A")

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.autoindent = true
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.numberwidth = 3

o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"

o.updatetime = 250
o.timeoutlen = 1000 -- im getting old
o.clipboard = "unnamedplus"
