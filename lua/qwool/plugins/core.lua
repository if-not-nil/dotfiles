return {
	"nvim-lua/plenary.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		setup = function()
			require("which-key").register({
				["<S-w>"] = { "<C-w>", "window command" },
			}, { prefix = "<leader>" })
		end,
	},

	"vuciv/golf",
}
