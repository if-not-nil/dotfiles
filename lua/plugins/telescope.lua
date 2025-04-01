return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
		vim.keymap.set('n', '<leader>fr', builtin.builtin, { desc = 'telescope help' })
		vim.keymap.set('n', '<leader>fg', builtin.command_history, { desc = 'cmd history' })
		vim.keymap.set('n', '<leader>fc', function()
			builtin.find_files {
				cwd = vim.fn.stdpath("config")
			}
		end
		, { desc = 'find in cfg' })
	end
}
