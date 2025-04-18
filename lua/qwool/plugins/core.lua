return {
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
	-- {
	--     "luukvbaal/nnn.nvim",
	--     opts = {
	--         replace_netrw = "explorer"
	--     }
	-- },
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	opts = {
	-- 		indent = { char = "│" },
	-- 		scope = { char = "│" },
	-- 	},
	-- }
}
