return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities({
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		})

		require("mason").setup()

		mason_lspconfig.setup({
			handlers = {
				-- Default handler
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Pylsp custom config
				pylsp = function()
					lspconfig.pylsp.setup({
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									pyflakes = { enabled = false },
									mccabe = { enabled = false },
								},
							},
						},
					})
				end,

				-- Svelte workaround for watcher issue
				svelte = function()
					lspconfig.svelte.setup({
						filetypes = { "svelte" },
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							if client.name == "svelte" and vim.bo[bufnr].filetype == "svelte" then
								vim.api.nvim_create_autocmd("BufWritePost", {
									pattern = { "*.js", "*.ts", "*.svelte" },
									callback = function(ctx)
										client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
									end,
								})
							end
						end,
					})
				end,

				-- Lua LSP with Neovim globals and runtime
				lua_ls = function()
					lspconfig.lua_ls.setup({
						cmd = { "lua-language-server" },
						filetypes = { "lua" },
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										vim.api.nvim_get_runtime_file("", true),
										"${3rd}/love2d/library",
									},
								},
								telemetry = { enable = false },
							},
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
