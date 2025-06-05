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
			zls = { "", stop_after_first = true },
			-- python = { "ruff" },
		},
		format_after_save = {
			lsp_format = "fallback",
		},
	},
}
