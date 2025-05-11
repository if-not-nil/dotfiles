return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	opts = {
		servers = {},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					"ruff",
				},
			},
			ensure_installed = { "lua_ls" },
		})
	end,

	vim.diagnostic.config({
		virtual_text = true,
	}),
}
