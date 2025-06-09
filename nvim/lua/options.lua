local opt = vim.opt

opt.termguicolors = true
-- o.background = "dark"
-- vim.cmd.colorscheme("retrobox")
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = false
opt.scrolloff = 5
opt.splitbelow = false
opt.shortmess:append("A")
opt.shada = { "'10", "<0", "s10", "h" }

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- o.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

-- it wont add comments
opt.formatoptions:remove("o")
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

opt.updatetime = 250
opt.timeoutlen = 1000 -- im getting old
opt.clipboard = "unnamedplus"
