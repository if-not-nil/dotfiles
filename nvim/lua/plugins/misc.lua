return {
	"nvim-lua/plenary.nvim",

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	--
	-- colorizer
	{
		"uga-rosa/ccc.nvim",
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
				enabled = { "css", "html", "tsx", "jsx", "svelte" },
			},
		},
	},
}
