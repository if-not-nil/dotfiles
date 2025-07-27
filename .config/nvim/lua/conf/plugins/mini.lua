return {
  { "echasnovski/mini.surround", opts = {} },
  { "echasnovski/mini.pairs",    opts = {} },
  { "echasnovski/mini.icons",    opts = {} },

  {
    "echasnovski/mini.tabline",
    opts = {
      format = function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and '* ' or ''
        return MiniTabline.default_format(buf_id, label) .. suffix
      end

    }
  },
}
