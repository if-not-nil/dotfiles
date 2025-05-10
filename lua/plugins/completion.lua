return {

	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				---@diagnostic disable-next-line: unused-local
				function(cmp)
					local ok, supermaven = pcall(require, "supermaven-nvim.completion_preview")
					if ok and supermaven.has_suggestion() then
						vim.schedule(supermaven.on_accept_suggestion)
						return true
					end
				end,
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
			menu = {
				scrollbar = false,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind", gap = 1 },
						{ "label_description", gap = 1 },
						{ "source_name", gap = 1 },
					},
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
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
