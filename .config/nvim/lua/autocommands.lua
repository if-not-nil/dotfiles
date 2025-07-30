local autocmd = vim.api.nvim_create_autocmd

-- highlight text on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- jump to last pos when opening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

local function update_tabline_visibility()
  local listed_buffers = vim.tbl_filter(function(buf)
    return vim.fn.buflisted(buf) == 1
  end, vim.api.nvim_list_bufs())

  if #listed_buffers >= 2 then
    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufEnter", "VimEnter" }, {
  callback = update_tabline_visibility,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "keymap 'q' to close help/quickfix/netrw/etc windows",
  pattern = "help,qf,netrw",
  callback = function()
    vim.keymap.set(
      "n",
      "q",
      "<C-w>c",
      { buffer = true, desc = "Quit (or Close) help, quickfix, netrw, etc windows" }
    )
  end,
})
