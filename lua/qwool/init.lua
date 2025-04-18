require("qwool.lazy_init")
require("qwool.remaps")
require("qwool.opts")

local augroup = vim.api.nvim_create_augroup
local MainGroup = augroup("main", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.keymap.set("n", "<leader>r", function()
	local output = vim.fn.system("./task.sh")
	vim.notify(output, vim.log.levels.INFO, { title = "task.sh Output" })
end, { desc = "run task.sh and show output" })

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

autocmd({ "BufWritePre" }, {
	group = MainGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
autocmd("LspAttach", {
	group = MainGroup,
	callback = function(e)
		local opts = { buffer = e.buf }

		local function map(mode, key, action, desc)
			opts.desc = desc
			vim.keymap.set(mode, key, action, opts)
		end

		map("n", "gd", vim.lsp.buf.definition, "go to definition")
		map("n", "K", vim.lsp.buf.hover, "show hover info")
		map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "search workspace symbols")
		map("n", "<leader>vd", vim.diagnostic.open_float, "show diagnostics")
		map("n", "<leader>vca", vim.lsp.buf.code_action, "show code actions")
		map("n", "<leader>vrr", vim.lsp.buf.references, "find references")
		map("n", "<leader>vrn", vim.lsp.buf.rename, "rename symbol")
		map("i", "<C-h>", vim.lsp.buf.signature_help, "show signature help")
		-- map("n", "<leader>f", vim.lsp.buf.format, "format code")
	end,
})
