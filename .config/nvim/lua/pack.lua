local map = vim.keymap.set

local hosts = {
  ["https://github.com/"] = {
    "echasnovski/mini.surround",
    "echasnovski/mini.tabline",
    "uga-rosa/ccc.nvim",
    "rafamadriz/friendly-snippets",
    "echasnovski/mini.pick",
    "echasnovski/mini.files",
    "echasnovski/mini.icons",
    "echasnovski/mini.snippets",
    "echasnovski/mini.pairs",
    "echasnovski/mini.extra",
    "neovim/nvim-lspconfig",
    "folke/zen-mode.nvim",
    "mbbill/undotree",
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
map("i", '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
map("n", "<leader>/", pick.builtin.grep_live)
map("n", "<leader>f", pick.builtin.files)
map("n", "<leader>?", miniextras.pickers.keymaps)
map("n", "<leader>d", function() miniextras.pickers.diagnostic({ scope = "current" }) end)
map("n", "<leader>l", vim.lsp.buf.format)
