-- vim.cmd.colorscheme("bark")
vim.diagnostic.config({
    float = { border = "single" },
    virtual_text = true,
})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.opt.shell = "fish"
vim.opt.fillchars:append({ eob = " " })
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.splitright = true
vim.opt.shortmess:append("A")
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.o.iminsert = 0
vim.o.imsearch = 0
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.langnoremap = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.inccommand = "split"

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions:remove("o")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.timeoutlen = 1000 -- im getting old
vim.opt.clipboard = "unnamedplus"

require("remaps")
require("autocommands")
require("plugins")

-- local v = vim.version()
-- if v.major == 0 and v.minor == 12 then
--     require("pack")
-- end
