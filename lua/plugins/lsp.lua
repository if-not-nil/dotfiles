return {

	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = function()
				require("lsp_lines").setup()
			end,
		},
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {},
		},
	},
	opts = {
		servers = {
			lua_ls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
		-- import lspconfig plugin

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			-- virtual_text = true,
			float = {
				style = "minimal",
				-- source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			pattern = "*",
			callback = function()
				for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
					if vim.api.nvim_win_get_config(winid).zindex then
						return
					end
				end
				vim.diagnostic.open_float({
					scope = "cursor",
					focusable = false,
					close_events = {
						"CursorMoved",
						"CursorMovedI",
						"BufHidden",
						"InsertCharPre",
						"WinLeave",
					},
				})
			end,
		})
	end,
}
