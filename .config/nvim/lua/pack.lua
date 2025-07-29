local map = vim.keymap.set

local hosts = {
  ["https://github.com/"] = {
    -- i really need this
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.surround",
    "echasnovski/mini.tabline",
    "mbbill/undotree",
    -- i dont need this that much
    "rafamadriz/friendly-snippets",
    "echasnovski/mini.pairs",
    "echasnovski/mini.pick",
    "echasnovski/mini.extra",
    "echasnovski/mini.files",
    "echasnovski/mini.snippets",
    "echasnovski/mini.icons",
    "uga-rosa/ccc.nvim",
  } -- this is completely unnecessary
}   -- however, no developers seem to be
-- self-hosting their projects
local packs = {
  { src = "https://github.com/saghen/blink.cmp" },
}
for host, packages in pairs(hosts) do
  for _, pkg in ipairs(packages) do
    table.insert(packs, host .. pkg)
  end
end
vim.pack.add(packs)
require("mini.tabline").setup({
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and "* " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
})
require("ccc").setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})
require("mini.icons").setup()
require("mini.surround").setup()
require('mini.pairs').setup()
require('mini.files').setup()
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
