return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/mini.icons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"filename",
					{ "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
				},
				lualine_c = { "" },
				lualine_x = { "" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
