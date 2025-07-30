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
map("n", "<leader>l", vim.lsp.buf.format)
map({"n", "i", "x"}, "<C-k>", vim.lsp.buf.hover)

