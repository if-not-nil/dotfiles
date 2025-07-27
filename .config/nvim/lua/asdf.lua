vim.api.nvim_create_user_command("DumpHighlights", function()
  vim.cmd("enew")  -- Open new empty buffer
  local lines = {
    "hi clear",
    "if exists('syntax_on') | syntax reset | endif",
    "let g:colors_name = 'mydump'",
  }

  local highlights = vim.api.nvim_exec("highlight", true)
  for _, line in ipairs(vim.split(highlights, "\n")) do
    -- Trim leading whitespace
    local trimmed = line:match("^%s*(.-)%s*$")
    -- Skip empty lines
    if trimmed ~= "" then
      local name = trimmed:match("^(%S+)")
      if trimmed:match("links to") then
        -- It's a link, extract properly
        local target = trimmed:match("links to (%S+)$")
        if name and target then
          table.insert(lines, "highlight! link " .. name .. " " .. target)
        end
      elseif trimmed:match("xxx") then
        -- It's a real highlight definition
        local attrs = trimmed:match("^%S+%s+xxx%s*(.+)$")
        if name and attrs then
          table.insert(lines, "highlight " .. name .. " " .. attrs)
        end
      end
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, {})
