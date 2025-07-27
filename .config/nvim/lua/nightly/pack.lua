local map = vim.keymap.set

vim.pack.add({
  "https://github.com/echasnovski/mini.surround",
  "https://github.com/echasnovski/mini.tabline",
  "https://github.com/echasnovski/mini.pick",
  "https://github.com/echasnovski/mini.files",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/echasnovski/mini.completion",
  "https://github.com/echasnovski/mini.snippets",
  "https://github.com/echasnovski/mini.pairs",
  "https://github.com/echasnovski/mini.statusline",
  "https://github.com/echasnovski/mini.extra",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/uga-rosa/ccc.nvim",
  "https://github.com/mbbill/undotree",
})

-- appearance
require("mini.tabline").setup({
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and "* " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
})
require("mini.statusline").setup({
  content = {
    active =
        function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git           = MiniStatusline.section_git({ trunc_width = 40 })
          local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
          local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
          local location      = string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))

          return MiniStatusline.combine_groups({
            { hl = mode_hl,                 strings = { string.upper(mode) } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
            '%<',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = mode_hl,                  strings = { location } },
          })
        end
  }
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
require('mini.completion').setup()
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
