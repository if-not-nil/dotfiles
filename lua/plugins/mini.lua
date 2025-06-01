return {

	-- { "echasnovski/mini.starter", opts = {} },
	-- { "echasnovski/mini.snippets", opts = {} },
	-- { "echasnovski/mini.pairs", opts = {} },
	-- { "echasnovski/mini.comment", opts = {} },
	-- { "echasnovski/mini.bufremove", opts = {} },
	-- { "echasnovski/mini.files", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{ "echasnovski/mini.icons", opts = {} },
	{ "echasnovski/mini.tabline", opts = {} },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- 	init = function()
	-- 		-- Load the colorscheme here.
	-- 		-- Like many other themes, this one has different styles, and you could load
	-- 		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	-- 		vim.cmd.colorscheme("tokyonight-night")
	--
	-- 		-- You can configure highlights by doing something like:
	-- 		vim.cmd.hi("Comment gui=none")
	-- 	end,
	-- },
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
				-- base00 = "#101010",
				-- base01 = "#202020",
				-- base02 = "#2b2b2b",
				-- base03 = "#505050",
				-- base04 = "#b0b0b0",
				-- base05 = "#d0d0d0",
				-- base06 = "#e0e0e0",
				-- base07 = "#fafafa",
				-- base08 = "#ab4642",
				-- base09 = "#dc9656",
				-- base0A = "#f7ca88",
				-- base0B = "#a1b56c",
				-- base0C = "#86c1b9",
				-- base0D = "#7cafc2",
				-- base0E = "#ba8baf",
				-- base0F = "#a16946",
			},
		},
	},
}
