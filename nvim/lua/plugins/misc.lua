return {
	"nvim-lua/plenary.nvim",
	-- note to self: dont add whichkey back just use leader+?
	-- "folke/which-key.nvim",

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

	-- im not putting any more effort into renaming files
	-- {
	-- 	"mikavilpas/yazi.nvim",
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{
	-- 			"<leader>e",
	-- 			"<cmd>Yazi toggle<cr>",
	-- 		},
	-- 		{
	-- 			"<leader>E",
	-- 			"<cmd>Yazi cwd<cr>",
	-- 		},
	-- 	},
	-- 	opts = {
	-- 		open_for_directories = true,
	-- 		keymaps = {
	-- 			show_help = "<f1>",
	-- 		},
	-- 		yazi_floating_window_border = "none",
	-- 	},
	-- 	init = function()
	-- 		vim.g.loaded_netrwPlugin = 1
	-- 	end,
	-- },
}
