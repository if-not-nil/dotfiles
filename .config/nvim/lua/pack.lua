local map = vim.keymap.set

local hosts = {
  ["https://github.com/"] = {
    "echasnovski/mini.surround",
    "echasnovski/mini.tabline",
    "uga-rosa/ccc.nvim",
    "echasnovski/mini.pick",
    "echasnovski/mini.files",
    "echasnovski/mini.icons",
    "echasnovski/mini.completion",
    "echasnovski/mini.snippets",
    "echasnovski/mini.pairs",
    "echasnovski/mini.extra",
    "neovim/nvim-lspconfig",
    "folke/zen-mode.nvim",
    "mbbill/undotree",
  } -- this is completely unnecessary
}   -- however, no developers seem to be
-- self-hosting their projects
local packs = {}
for host, packages in pairs(hosts) do
  for _, pkg in ipairs(packages) do
    table.insert(packs, host .. pkg)
  end
end
vim.pack.add(packs)

map("n", "<leader>Z", function()
  require("zen-mode").toggle({
    window = { width = 0.8 } })
end)

-- appearance
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
map("n", "<leader>u", vim.cmd.UndotreeToggle)
require("mini.icons").setup()
require("mini.surround").setup()

-- lsp
MiniIcons.tweak_lsp_kind()
require('mini.completion').setup({
  lsp_completion = {
    -- `source_func` should be one of 'completefunc' or 'omnifunc'.
    source_func = 'omnifunc'
  }
})

require("mini.snippets").setup({
  mappings = {
    jump_next = '<C-j>',
    jump_prev = '<C-k>',
    stop = '<Esc>',
  },
})

-- workflow
require('mini.pairs').setup()
local pick = require("mini.pick")
local miniextras = require("mini.extra")
require('mini.files').setup()

map("n", "<leader>e", MiniFiles.open)
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    vim.keymap.set('n', '<Esc>', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
    vim.keymap.set('n', '<leader>e', function() MiniFiles.close() end, { buffer = args.data.buf_id, desc = 'Close' })
  end,
})
_G.cr_action = function()
  -- If there is selected item in popup, accept it with <C-y>
  if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
  -- Fall back to plain `<CR>`. You might want to customize according
  -- to other plugins. For example if 'mini.pairs' is set up, replace
  -- next line with `return MiniPairs.cr()`
  return '\r'
end

vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })
map("i", '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
map("n", "<leader>/", pick.builtin.grep_live)
map("n", "<leader>f", pick.builtin.files)
map("n", "<leader>?", miniextras.pickers.keymaps)
map("n", "<leader>d", function() miniextras.pickers.diagnostic({ scope = "current" }) end)
map("n", "<leader>l", vim.lsp.buf.format)
