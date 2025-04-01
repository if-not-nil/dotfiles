-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --
vim.o.number = true
vim.o.ignorecase = true
vim.o.autoindent = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.opt.shortmess:append("A")
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamedplus'
vim.o.relativenumber = true

vim.g.mapleader = ' '

vim.keymap.set({ "n", "x" }, "<leader>tn", "<cmd>tabnew<cr>")
vim.keymap.set({ "n", "x" }, "<leader>t<Tab>", "<cmd>tabprev<cr>")
vim.keymap.set({ "n", "x" }, "<leader>tw", "<cmd>tabclose<cr>")

vim.keymap.set('n', '<leader>q', '<cmd>bdelete<cr>', { desc = 'close buffer' })

vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true, desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { noremap = true, desc = 'Previous buffer' })

vim.keymap.set({ "n", "x" }, ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set('x', 'p', '"_dP', { noremap = true, desc = 'Paste without copying deleted text' })
vim.keymap.set({ "n", "x" }, "U", vim.cmd.redo)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("n", "<leader>r", function()
			if vim.fn.getcwd():match(vim.fn.expand("~/.config/nvim")) then
				vim.cmd("source $MYVIMRC")
				print("Neovim config reloaded!")
			else
				vim.cmd("!go run .")
			end
		end, { buffer = true, desc = "Run Go module or reload Neovim config" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<leader>r", function()
			if vim.fn.getcwd():match(vim.fn.expand("~/.config/nvim")) then
				vim.cmd("source $MYVIMRC")
				print("Neovim config reloaded!")
			else
				vim.cmd("!python3 %")
			end
		end, { buffer = true, desc = "Run Python script or reload Neovim config" })
	end,
})

-- vim.keymap.set("i", "jk", "<ESC>")
-- vim.keymap.set("n", "R", ":w<cr>:!love .<cr>")

-- Space as leader key

-- Basic clipboard interaction
-- vim.keymap.set({'n', 'x', 'o'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
-- vim.keymap.set({'n', 'x', 'o'}, 'gp', '"+p', {desc = 'Paste clipboard content'})

-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

require("plugins") -- Load plugins from lua/plugins.lua
require("lsp")
