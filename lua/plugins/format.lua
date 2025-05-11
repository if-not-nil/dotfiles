return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome", stop_after_first = true },
			typescript = { "biome", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettier", stop_after_first = true },
			typescriptreact = { "biome", stop_after_first = true },
			-- python = { "ruff" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
