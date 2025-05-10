return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		indent = { enabled = false, only_scope = true, animate = { enabled = false } },
		quickfile = { enabled = true },
		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["qq"] = { "close", mode = { "n", "i" } },
					},
				},
			},
		},

		-- scope = { enabled = true, underline = true },
		-- statuscolumn = { enabled = true },
		-- explorer = { enabled = true, replace_netrw = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
		},
		{
			"<leader><Tab>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>?",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "maps",
		},

		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},

		{
			"<leader>h",
			function()
				Snacks.picker.pickers()
			end,
			desc = "ls pickers",
		},
		{
			"<leader>b",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
				Snacks.toggle.diagnostics():map("<leader>td")
				Snacks.toggle.line_number():map("<leader>tl")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>tc")
				Snacks.toggle.treesitter():map("<leader>tT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>tb")
				-- Snacks.toggle.inlay_hints():map("<leader>th")
				Snacks.toggle.indent():map("<leader>s")
				Snacks.toggle.dim():map("<leader>tD")
			end,
		})
	end,
}
