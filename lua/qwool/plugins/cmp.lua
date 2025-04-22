return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"tailwind-tools",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths

		-- luasnip configuration
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets", -- friendly snippets for luasnip
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			build = "make install_jsregexp", -- luasnip build command
			config = function(_, opts)
				require("luasnip").config.set_config(opts)
				require("qwool.configs.luasnip") -- custom luasnip configuration
			end,
		},

		-- autocompletion with luasnip
		"saadparwaiz1/cmp_luasnip", -- for luasnip integration
		"onsails/lspkind.nvim", -- vscode-like pictograms in completion menu
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- load snippets from vscode-style plugins (e.g., friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- nvim-cmp setup
		cmp.setup({
			-- completion options
			completion = {
				completeopt = "menu,menuone,preview,noselect", -- menu options
			},

			-- snippet setup
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- expanding luasnip snippets
				end,
			},

			-- key mappings for autocompletion
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll docs up
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll docs down
				["<C-Space>"] = cmp.mapping.complete(), -- trigger completion
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selected item
			}),

			-- sources for completion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp source for language server completions
				{ name = "luasnip" }, -- luasnip source for snippet completions
				{ name = "buffer" }, -- buffer source for text in current buffer
				{ name = "path" }, -- path source for file system paths
			}),

			-- formatting options for lspkind (vscode-like pictograms)
			formatting = {
				format = lspkind.cmp_format({
					before = require("tailwind-tools.cmp").lspkind_format, -- tailwind css completion support
					maxwidth = 50, -- maximum width of completion item
					ellipsis_char = "...", -- truncate with ellipsis
				}),
			},
		})
	end,
}
