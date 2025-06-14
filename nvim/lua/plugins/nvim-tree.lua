return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			side = "left",
		},
	},
	keys = {
		{
			"<leader>b",
			"<cmd>NvimTreeToggle<cr>",
		},
	},
}
