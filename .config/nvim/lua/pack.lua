local map = vim.keymap.set

vim.pack.add({
  -- i really need this
  "https://github.com/echasnovski/mini.snippets",
  "https://github.com/echasnovski/mini.tabline",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/saghen/blink.cmp",
  -- i dont need this that much
  "https://github.com/echasnovski/mini.surround",
  "https://github.com/echasnovski/mini.files",
  "https://github.com/echasnovski/mini.pick",
  "https://github.com/echasnovski/mini.extra",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/mbbill/undotree",
  "https://github.com/uga-rosa/ccc.nvim",
})

require("mini.tabline").setup {
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and "* " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
}
-- ^n ^p to navigate and select
-- ^e to cancel
-- ^y to confirm
-- CR to select with up/down arrows, else newline
require("blink.cmp").setup({
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  keymap = {
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" }
  },
  fuzzy = { implementation = 'lua' },
  snippets = { preset = 'mini_snippets' }
})

require("mini.surround").setup()
require("mini.files").setup()
require("ccc").setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    vim.keymap.set('n', '<Esc>', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
    vim.keymap.set('n', '<leader>e', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
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

map("n", "<leader>u", vim.cmd.UndotreeToggle)

map("n", "<leader>e", MiniFiles.open)
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
