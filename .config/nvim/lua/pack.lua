local map = vim.keymap.set

local hosts = {
  ["https://github.com/"] = {
    -- i really need this
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    { "echasnovski/mini.surround", opts = {} },
    {
      "echasnovski/mini.tabline",
      opts = {
        format = function(buf_id, label)
          local suffix = vim.bo[buf_id].modified and "* " or ""
          return MiniTabline.default_format(buf_id, label) .. suffix
        end,
      }
    },
    "mbbill/undotree",
    -- i dont need this that much
    "rafamadriz/friendly-snippets",
    { "echasnovski/mini.pairs",    opts = {} },
    "echasnovski/mini.pick",
    "echasnovski/mini.extra",
    { "echasnovski/mini.files", opts = {} },
    "echasnovski/mini.snippets",
    { "echasnovski/mini.icons", opts = {} },
    "uga-rosa/ccc.nvim",
    "saghen/blink.cmp",
    {
      "echasnovski/mini.base16",
      opts = {
        palette = {
          base00 = "#181818",
          base01 = "#282828",
          base02 = "#383838",
          base03 = "#585858",
          base04 = "#b8b8b8",
          base05 = "#d8d8d8",
          base06 = "#e8e8e8",
          base07 = "#f8f8f8",
          base08 = "#ab4642",
          base09 = "#dc9656",
          base0A = "#f7ca88",
          base0B = "#a1b56c",
          base0C = "#86c1b9",
          base0D = "#7cafc2",
          base0E = "#ba8baf",
          base0F = "#a16946",
        }
      }
    },

  } -- this is completely unnecessary
}   -- however, no developers seem to be
-- self-hosting their projects
local packs = {
}
for host, packages in pairs(hosts) do
  for _, pkg in ipairs(packages) do
    if type(pkg) == "table" then
      if type(pkg[1]) == "string" then
        pkg.src = pkg[1]
      end
      pkg.src = host .. pkg.src
      table.insert(packs, pkg)
    else
      table.insert(packs, host .. pkg)
    end
  end
end
vim.pack.add(packs)

for _, pack in ipairs(packs) do
  if pack.opts then
    assert(type(pack.opts) == "table")
    require(string.match(pack.src, ".*/(.-)$")).setup(pack.opts)
  end
end

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
