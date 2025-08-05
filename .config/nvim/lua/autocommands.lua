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


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md" },
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
    nested = true,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man" },
    command = "wincmd L",
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
                local lsp_map = function(modes, key, cmd)
            vim.keymap.set(modes, key, cmd, { buffer = event.buf })
        end
        lsp_map("n", "gd", vim.lsp.buf.definition)
        lsp_map("n", "gq", vim.lsp.buf.format)

        lsp_map("n", "K", vim.lsp.buf.hover)
        lsp_map("n", "<C-k>", vim.diagnostic.open_float)
    end,
})
