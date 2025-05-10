local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(e)
		local opts = { buffer = e.buf }

		local function map(mode, key, action, desc)
			opts.desc = desc
			vim.keymap.set(mode, key, action, opts)
		end

		-- LSP keybindings
		map("n", "gra", vim.lsp.buf.code_action, "code action")
		map("n", "K", vim.lsp.buf.hover, "show hover info")
		map("n", "grs", vim.lsp.buf.workspace_symbol, "search workspace symbols")
		map("n", "gd", vim.lsp.buf.definition, "go to definition")
		map("n", "fD", vim.lsp.buf.declaration, "go to declaration")
		map("i", "<C-h>", vim.lsp.buf.signature_help, "show signature help")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "see available code actions")
		-- map("n", "<leader>rn", vim.lsp.buf.rename, "smart rename")
		-- map("n", "[d", vim.diagnostic.goto_prev, "go to previous diagnostic")
		-- map("n", "]d", vim.diagnostic.goto_next, "go to next diagnostic")
		-- map("n", "<leader>rs", "<cmd>LspRestart<CR>", "restart lsp")
	end,
})

-- local MainGroup = augroup("main", {})
-- autocmd({ "BufWritePre" }, {
-- 	group = MainGroup,
-- 	pattern = "*",
-- 	command = [[%s/\s\+$//e]],
-- })
