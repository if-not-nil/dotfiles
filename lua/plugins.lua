local lazy = {}

function lazy.install(path)
	local uv = vim.uv or vim.loop
	if not uv.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = table.concat({
	vim.fn.stdpath('data'),
	'lazy',
	'lazy.nvim'
}, '/')

lazy.opts = {}

lazy.setup({
	-- {'folke/tokyonight.nvim'},
	{ 'folke/which-key.nvim' },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000,  -- needs to be loaded in first
		config = function()
			require('tiny-inline-diagnostic').setup({
				preset = "minimal"
			})
			vim.diagnostic.config({ virtual_text = false })
		end
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{ 'echasnovski/mini.nvim',           branch = 'main' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':tsupdate' },
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
			-- { "nvim-telescope/telescope-fzf-native", build="make" }
		}
	},
	"luukvbaal/nnn.nvim",
	'theprimeagen/vim-be-good',
	"norcalli/nvim-colorizer.lua",
	"mfussenegger/nvim-lint",
})

-- ========================================================================== --
-- ==                         plugin configuration                         == --
-- ========================================================================== --
require 'colorizer'.setup()

require('nnn').setup({
	replace_netrw = "picker"
})
vim.keymap.set('n', '<leader>e', function()
	if vim.fn.bufexists('nnn') == 1 then
		vim.cmd('bdelete nnn')
	else
		vim.cmd('NnnPicker')
	end
end, { desc = "toggle nnnpicker" })

vim.keymap.set('n', '<leader>b', function()
	if vim.fn.bufexists('nnn') == 1 then
		vim.cmd('bdelete nnn')
	else
		vim.cmd('NnnExplorer')
	end
end, { desc = "toggle nnnexplorer" })
vim.keymap.set("n", "<leader>q", function()
	require("mini.bufremove").delete(0, false)
end, { desc = "Close buffer" })
-- treesitter setup
-- require('nvim-treesitter.configs').setup({
-- 	highlight = { enable = true },
-- 	auto_install = true,
-- 	ensure_installed = { 'lua', 'vim', 'vimdoc', 'json' },
-- })

-- which-key setup
require('which-key').setup({
	icons = {
		mappings = false,
		keys = {
			space = 'space',
			esc = 'esc',
			bs = 'backspace',
			c = 'ctrl-',
		},
	},
})

require('which-key').add({
	{ '<leader>f', group = 'telescope' },
	{ '<leader>b', group = 'buffer' },
})

-- mini.nvim plugins setup
require('mini.comment').setup({})
-- require('mini.starter').setup({})
require('mini.surround').setup({
	mappings = {
		add = 'sa',          -- add srrounding in normal and visual modes
		delete = 'sd',       -- delete surrounding
		find = 'sf',         -- find surrounding (to the right)
		find_left = 'sf',    -- find surrounding (to the left)
		highlight = 'sh',    -- highlight surrounding
		replace = 'sr',      -- replace surrounding
		update_n_lines = 'sn', -- update `n_lines`

		suffix_last = 'l',   -- suffix to search with "prev" method
		suffix_next = 'n',   -- suffix to search with "next" method
	},
})
require('mini.icons').setup({})
require('mini.pairs').setup({})
require('mini.bufremove').setup({})
require('mini.tabline').setup({})
require('mini.snippets').setup({})
require('mini.completion').setup({
	lsp_completion = {
		auto_setup = true
	}
})

vim.keymap.set('i', '<Tab>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true, noremap = true, desc = 'Next completion' })

vim.keymap.set('i', '<S-Tab>', function()
	return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true, noremap = true, desc = 'Previous completion' })

vim.keymap.set('i', '<CR>', function()
	return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true, noremap = true, desc = 'Confirm completion' })

vim.keymap.set('i', '<C-Space>', '<Cmd>lua MiniCompletion.complete()<CR>', { desc = 'Trigger completion' })

require('mini.base16').setup({
	-- table with names from `base00` to `base0f` and values being strings of
	-- hex colors with format "#rrggbb". note: this should be explicitly
	-- supplied in `setup()`.
	palette = {
		base00 = '#181818',
		base01 = '#282828',
		base02 = '#383838',
		base03 = '#585858',
		base04 = '#b8b8b8',
		base05 = '#d8d8d8',
		base06 = '#e8e8e8',
		base07 = '#f8f8f8',
		base08 = '#ab4642',
		base09 = '#dc9656',
		base0A = '#f7ca88',
		base0B = '#a1b56c',
		base0C = '#86c1b9',
		base0D = '#7cafc2',
		base0E = '#ba8baf',
		base0F = '#a16946',

	},

})
-- buffer removal mapping
-- vim.keymap.set('n', '<leader>q', '<cmd>lua pcall(minibufremove.delete)<cr>', { desc = 'close buffer' })

-- minifiles for file explorer
-- local mini_files = require('mini.files')
-- mini_files.setup({})

-- vim.keymap.set('n', '<leader>e', function()
-- 	if mini_files.close() then
-- 		return
-- 	end
-- 	mini_files.open()
-- end, { desc = 'file explorer' })

-- telescope bindings
vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>?', require("telescope.builtin").keymaps, { desc = 'keymap help' })
vim.keymap.set('n', '<leader>fr', require("telescope.builtin").builtin, { desc = 'telescope help' })
vim.keymap.set('n', '<leader>fg', require("telescope.builtin").command_history, { desc = 'cmd history' })
vim.keymap.set('n', '<leader>fd', require("telescope.builtin").diagnostics, { desc = 'diagnostics' })
vim.keymap.set('n', '<leader>fe', require("telescope.builtin").live_grep, { desc = 'cmd history' })
vim.keymap.set('n', '<leader>fc', function()
	require("telescope.builtin").find_files {
		cwd = vim.fn.stdpath("config")
	}
end
, { desc = 'find in cfg' })

-- Statusline setup
local mini_statusline = require('mini.statusline')

local function statusline()
	local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 120 })
	local diagnostics = mini_statusline.section_diagnostics({ trunc_width = 75 })
	local lsp = mini_statusline.section_lsp({ icon = 'LSP', trunc_width = 75 })
	local filename = mini_statusline.section_filename({ trunc_width = 140 })
	local percent = '%2p%%'
	local location = '%3l:%-2c'

	return mini_statusline.combine_groups({
		{ hl = mode_hl,                 strings = { mode } },
		{ hl = 'MiniStatuslineDevinfo', strings = { diagnostics, lsp } },
		'%<',
		{ hl = 'MiniStatuslineFilename', strings = { filename } },
		'%=',
		{ hl = 'MiniStatuslineFilename', strings = { '%{&filetype}' } },
		{ hl = 'MiniStatuslineFileinfo', strings = { percent } },
		{ hl = mode_hl,                  strings = { location } },
	})
end

mini_statusline.setup({
	content = { active = statusline },
})
