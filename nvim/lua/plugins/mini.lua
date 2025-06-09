return {
	-- { -- that'll take a bit to learn!
	-- 	"echasnovski/mini.align",
	-- 	opts = {
	-- 		mappings = {
	-- 			start = "gA",
	-- 			start_with_preview = "ga",
	-- 		},
	-- 	},
	-- },
	-- { "echasnovski/mini.files", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{ "echasnovski/mini.pairs", opts = {} },
	{ "echasnovski/mini.icons", opts = {} },

	{ "echasnovski/mini.tabline", opts = {} },
	{
		"echasnovski/mini.base16",
		opts = {
			palette = {
				base00 = "#101010",
				base01 = "#202020",
				base02 = "#2b2b2b",
				base03 = "#505050",
				base04 = "#b0b0b0",
				base05 = "#d0d0d0",
				base06 = "#e0e0e0",
				base07 = "#fafafa",
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
	-- {
	-- 	"echasnovski/mini.statusline",
	-- 	opts = {
	-- 		content = {
	-- 			active = function()
	-- 				local MiniStatusline = require("mini.statusline")
	-- 				local mode_title, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	-- 				local mode = string.upper(mode_title)
	-- 				local git = MiniStatusline.section_git({ trunc_width = 40 })
	-- 				local diff = MiniStatusline.section_diff({ trunc_width = 75 })
	-- 				local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75, use_icons = false })
	-- 				local lsp = MiniStatusline.section_lsp({ trunc_width = 75, use_icons = false })
	-- 				local filename = MiniStatusline.section_filename({ trunc_width = 140 })
	-- 				-- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
	-- 				-- local location = MiniStatusline.section_location({ trunc_width = 75 })
	-- 				local location = string.format("%d:%d", vim.fn.line("."), vim.fn.col(".")) -- e.g. 12:34
	-- 				-- local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
	--
	-- 				return MiniStatusline.combine_groups({
	-- 					{ hl = mode_hl, strings = { mode } },
	-- 					{ hl = "MiniStatuslineDevinfo", strings = { filename } },
	-- 					"%<", -- Mark general truncate point
	-- 					{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
	-- 					"%=", -- End left alignment
	-- 					-- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
	-- 					-- { hl = mode_hl, strings = { search, location } },
	-- 					{ hl = mode_hl, strings = { location } },
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- },
}
