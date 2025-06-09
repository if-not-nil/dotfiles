return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			file_ignore_patterns = { "node_modules" },
			defaults = {
				mappings = {
					i = {
						["qq"] = actions.close, -- lmao
						["<esc>"] = actions.close,
					},
				},
			},
		})

		local map = vim.keymap.set
		local builtin = require("telescope.builtin")

		-- map("n", "<leader>fg", builtin.command_history, { desc = "cmd history" })
		map("n", "<leader>d", builtin.diagnostics, { desc = "diagnostics" })
		map("n", "<leader>r", builtin.lsp_references, { desc = "lsp ref" })
		map("n", "<leader>ll", builtin.commands, { desc = "commands" })
		map("n", "<leader>D", builtin.lsp_definitions, { desc = "definitions" })
		-- map("n", "<leader>i", builtin.lsp_implementations, { desc = "implementations" })
		-- map("n", "<leader>t", builtin.lsp_type_definitions, { desc = "type defs" })
		--
		map("n", "<leader>tt", builtin.builtin, { desc = "telescope help" })
		map("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "buffer diagnostics" })
		map("n", "<leader>f", builtin.find_files, { desc = "find files" })
		map("n", "<leader>s", builtin.lsp_document_symbols, { desc = "lsp document symbols" })
		map("n", "<leader>?", builtin.keymaps, { desc = "keymaps" }) -- mneminoc: huh?
		map("n", "<leader>/", builtin.live_grep, { desc = "live grep" }) -- mnemonic: RipgRep
		map("n", "<leader><Tab>", builtin.buffers, { desc = "find open buffers" })
		map("n", "<leader>,", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "find in cfg" })
	end,
}
