return {
	"nvim-lua/plenary.nvim",

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- { "norcalli/nvim-colorizer.lua", opts = { "css", "html", "tsx", "jsx", "svelte" } },
	{ "windwp/nvim-ts-autotag" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
