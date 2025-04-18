return {
	{
		"echasnovski/mini.base16",
		opts = {
			palette = {
				base00 = "#181818",
				base01 = "#282828",
				base02 = "#383838",
				base03 = "#585858",
				base04 = "#b8b8b8",
				base05 = "#d8d8d8",
				base06 = "#e8e8e8",
				base07 = "#f8f8f8",
				base08 = "#ab4642",
				base09 = "#dc9656",
				base0A = "#f7ca88",
				base0B = "#a1b56c",
				base0C = "#86c1b9",
				base0D = "#7cafc2",
				base0E = "#ba8baf",
				base0F = "#a16946",
			},
		},
	},

	{ "echasnovski/mini.comment", opts = {} },
	-- { 'echasnovski/mini.starter', opts = {} },
	{ "echasnovski/mini.surround", opts = {} },

	{ "echasnovski/mini.bufremove", opts = {} },
	{ "echasnovski/mini.snippets", opts = {} },
	{ "echasnovski/mini.icons", opts = {} },
	-- { "echasnovski/mini.pairs", opts = {} },
	{ "echasnovski/mini.tabline", opts = {} },
	-- {
	-- 	"echasnovski/mini.files",
	-- 	opts = {
	-- 		options = {
	-- 			use_as_default_explorer = true,
	-- 		},
	-- 		mappings = {
	-- 			go_in = "L",
	-- 			go_in_plus = "l",
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>e",
	-- 			function()
	-- 				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
	-- 			end,
	-- 			desc = "Open mini.files (Directory of Current File)",
	-- 		},
	-- 		{
	-- 			"<leader>E",
	-- 			function()
	-- 				require("mini.files").open(vim.uv.cwd(), true)
	-- 			end,
	-- 			desc = "Open mini.files (cwd)",
	-- 		},
	-- 	},
	-- },

	{
		"echasnovski/mini.statusline",
		opts = {
			content = {
				active = function()
					local mode, mode_hl = require("mini.statusline").section_mode({ trunc_width = 120 })
					local diagnostics = require("mini.statusline").section_diagnostics({ trunc_width = 75 })
					local lsp = require("mini.statusline").section_lsp({ icon = "LSP", trunc_width = 75 })
					local filename = require("mini.statusline").section_filename({ trunc_width = 140 })
					local percent = "%2p%%"
					local location = "%3l:%-2c"

					return require("mini.statusline").combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineFilename", strings = { "%{&filetype}" } },
						{ hl = "MiniStatuslineFileinfo", strings = { percent } },
						{ hl = mode_hl, strings = { location } },
					})
				end,
			},
		},
	},
}
