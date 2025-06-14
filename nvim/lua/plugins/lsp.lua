return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			-- {
			-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			-- 	opts = {},
			-- },
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" }, -- Recognize 'vim' as a global variable
							},
							workspace = {
								library = {
									vim.api.nvim_get_runtime_file("", true),
									"${3rd}/love2d/library",
									"${3rd}/amulet/library",
								}, -- Include Neovim runtime files
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				zls = {
					settings = {
						zls = {
							enable_build_on_save = true,
						},
					},
				},
				clangd = {},
				svelte = {
					filetypes = { "svelte" },
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
				},
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								ruff = {
									-- formatter + Linter + isort
									enabled = true,
									extendIgnore = {
										"D103",
										"ERA001",
										"D100",
										"FBT003",
										"E501",
										"PLW0603",
									},
									extendSelect = { "ALL" },
									format = { "ALL" },
								},
								-- formatter options
								black = { enabled = false },
								autopep8 = { enabled = false },
								yapf = { enabled = false },
								-- linter options
								pylint = { enabled = false },
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								-- type checker
								pylsp_mypy = { enabled = true },
								mypy = { enabled = true },
								-- auto-completion options
								jedi_completion = { fuzzy = true },
								-- import sorting
								pyls_isort = { enabled = false },
								mccabe = { enabled = false },
							},
						},
					},
				},
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
			vim.keymap.set("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
			end)
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = { "lua_ls" },
			})
			-- require("lsp").rust_analyzer.setup()
		end,

		vim.diagnostic.config({
			virtual_text = {
				prefix = "",
			},
			float = { border = "single" },
			-- virtual_lines = false,
		}),
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", stop_after_first = true },
				typescript = { "biome", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettier", stop_after_first = true },
				typescriptreact = { "biome", stop_after_first = true },
				zls = { "", stop_after_first = true },
				-- python = { "ruff" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		},
	},
}
