return {

	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "none",
			["<Tab>"] = {
				"select_next",
				"fallback",
			},

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		enabled = function()
			return not vim.tbl_contains({ "md", "markdown" }, vim.bo.filetype)
		end,
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = {
			enabled = true,
			window = {
				show_documentation = false,
			},
		},
		completion = {
			list = { selection = { preselect = false } },
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
		},
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
