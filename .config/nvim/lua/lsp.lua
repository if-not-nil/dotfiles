local map = vim.keymap.set

vim.lsp.enable(
  { "lua_ls", "gopls", "zls", "biome", "ts_ls", "clangd", "pylsp" }
)

vim.diagnostic.config({
  float = { border = "single" },
  virtual_text = true,
})

map("n", "K", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end, { desc = "diagnostics or hover" })
map("n", "gd", vim.lsp.buf.definition)


require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<Tab>"] = {
      "select_next",
      "fallback",
    },

    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },
  fuzzy = {
    implementation = 'lua'
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
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

  snippets = { preset = 'mini_snippets' },
})
