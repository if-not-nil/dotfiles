-- vim.o.winborder = "rounded"
-- o.background = "dark"
-- vim.cmd.colorscheme("bark")

vim.opt.termguicolors = true
vim.opt.fillchars:append({ eob = " " })
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 5
vim.opt.splitbelow = false
vim.opt.shortmess:append("A")
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.o.iminsert = 0
vim.o.imsearch = 0
vim.o.langnoremap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.inccommand = "split"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

-- it wont add comments
vim.opt.formatoptions:remove("o")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000 -- im getting old
vim.opt.clipboard = "unnamedplus"
