local spec = {
    {
        "echasnovski/mini.base16",
        opts = { palette = require("base16") },
        config = function()
            local base16 = require("base16")
            require("mini.base16").setup({ palette = base16 })
            local hl = vim.api.nvim_set_hl
            hl(0, "SignColumn", { fg = base16.base09, bg = nil })
            hl(0, "CursorColumn", { fg = base16.base09, bg = nil })
            hl(0, "FoldColumn", { fg = base16.base09, bg = nil })
            hl(0, "LineNr", { bg = nil })
            hl(0, "LineNrAbove", { fg = base16.base03, bg = nil })
            hl(0, "LineNrBelow", { fg = base16.base03, bg = nil })
            hl(0, "DiagnosticFloatingError", { fg = base16.base08, bg = base16.base00 })
            hl(0, "DiagnosticFloatingHint", { fg = base16.base0D, bg = base16.base00 })
            hl(0, "DiagnosticFloatingInfo", { fg = base16.base0C, bg = base16.base00 })
            hl(0, "DiagnosticFloatingOk", { fg = base16.base0B, bg = base16.base00 })
            hl(0, "DiagnosticFloatingWarn", { fg = base16.base0E, bg = base16.base00 })
        end
    },
    {

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
    },
    { "echasnovski/mini.extra", opts = {} },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
            require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

            require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })

            local ls = require("luasnip")

            vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-e>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
        build = "make install_jsregexp",
    },
    {
        "echasnovski/mini.pick",
        opts = {},
        keys = {
            { "<leader>/", function() require("mini.pick").builtin.grep_live() end, },
            { "<leader>f", function() require("mini.pick").builtin.files() end, },
            { "<leader>?", function() require("mini.extra").pickers.keymaps() end, },
            {
                "<leader>d",
                function() require("mini.extra").pickers.diagnostic({ scope = "current" }) end,
            },
            {
                "<leader>D",
                function() require("mini.extra").pickers.diagnostic() end,
            },
        },
        config = function()
            local MiniPick = require("mini.pick")
            vim.ui.select = MiniPick.ui_select
        end
    },
    { "echasnovski/mini.icons", },

    {
        "echasnovski/mini.files",
        opts = { windows = { preview = true, width_preview = 60 },
        },
        keys = {
            { "<leader>e",
                function() require("mini.files").open() end, },
            { "<leader>E",
                function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end, },
        },
    },

    -- lsp
    { "neovim/nvim-lspconfig", },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-s>",
                        node_incremental = "<C-s>",
                        scope_incremental = false,
                        node_decremental = "<BS>",
                    },
                },
            })
        end,
    },

    -- misc
    { "rafamadriz/friendly-snippets", },
    { "mbbill/undotree", },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup({
                highlighter = {
                    auto_enable = true,
                    lsp = true,
                },
            })
        end,
    },
    { 'nvim-lualine/lualine.nvim',
        opts = require("statusline")
    }


}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = spec,
    checker = { enabled = true },
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        vim.keymap.set("n", "<Esc>", function()
            MiniFiles.close()
        end, { buffer = args.data.buf_id, desc = "Close" })
        vim.keymap.set("n", "<leader>e", function()
            MiniFiles.close()
        end, { buffer = args.data.buf_id, desc = "Close" })
    end,
})
