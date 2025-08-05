local map = vim.keymap.set

vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/echasnovski/mini.completion",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/echasnovski/mini.snippets",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hedyhli/outline.nvim",

    "https://github.com/echasnovski/mini.extra",
    "https://github.com/echasnovski/mini.base16",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/echasnovski/mini.pick",
    "https://github.com/echasnovski/mini.surround",
    "https://github.com/echasnovski/mini.files",
    "https://github.com/mbbill/undotree",
    "https://github.com/uga-rosa/ccc.nvim",
    'https://github.com/nvim-lualine/lualine.nvim',
})

-- lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("mini.completion").setup()
require("outline").setup({})
vim.diagnostic.config({
    float = { border = "single" },
    virtual_text = true,
})


vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local lsp_map = function(modes, key, cmd)
            vim.keymap.set(modes, key, cmd, { buffer = event.buf })
        end
        lsp_map("n", "gd", vim.lsp.buf.definition)
        lsp_map("n", "gq", vim.lsp.buf.format)
    end,
})
require("mini.snippets").setup({
    snippets = {
        require("mini.snippets").gen_loader.from_lang(),
    },
    mappings = {
        jump_next = '<C-j>',
        jump_prev = '<C-k>',
        stop = '<Esc>',
    },
})

require 'nvim-treesitter.configs'.setup({
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
    }
})


-- appearance
require("statusline")
require("mini.icons").tweak_lsp_kind()
local base16 = require("base16")
require("mini.base16").setup({ palette = base16 })
local hl = vim.api.nvim_set_hl
hl(0, 'SignColumn', { fg = base16.base09, bg = nil })
hl(0, 'CursorColumn', { fg = base16.base09, bg = nil })
hl(0, 'FoldColumn', { fg = base16.base09, bg = nil })
hl(0, 'LineNr', { bg = nil })
hl(0, 'LineNrAbove', { fg = base16.base03, bg = nil })
hl(0, 'LineNrBelow', { fg = base16.base03, bg = nil })
hl(0, 'DiagnosticFloatingError', { fg = base16.base08, bg = base16.base00 })
hl(0, 'DiagnosticFloatingHint', { fg = base16.base0D, bg = base16.base00 })
hl(0, 'DiagnosticFloatingInfo', { fg = base16.base0C, bg = base16.base00 })
hl(0, 'DiagnosticFloatingOk', { fg = base16.base0B, bg = base16.base00 })
hl(0, 'DiagnosticFloatingWarn', { fg = base16.base0E, bg = base16.base00 })

require("ccc").setup({
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
})

-- workflow
require("mini.surround").setup()
require("mini.files").setup({
    windows = { preview = true, width_preview = 60, }
})
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        vim.keymap.set('n', '<Esc>', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
        vim.keymap.set('n', '<leader>e', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
    end,
})
map("n", "<leader>e", MiniFiles.open)


map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- open at the file's dir
map("n", "<leader>E", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end)

map("i", '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

local MiniPick = require("mini.pick")
vim.ui.select = MiniPick.ui_select
local MiniExtras = require("mini.extra")
map("n", "<leader>/", MiniPick.builtin.grep_live)
map("n", "<leader>f", MiniPick.builtin.files)
map("n", "<leader>?", MiniExtras.pickers.keymaps)
map("n", "<leader>d", function() MiniExtras.pickers.diagnostic({ scope = "current" }) end)
map("n", "<leader>D", function() MiniExtras.pickers.diagnostic() end)
