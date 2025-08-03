vim.lsp.enable(
    { "lua_ls", "gopls", "zls", "biome", "ts_ls", "clangd", "pylsp" }
)
vim.lsp.config("zls", {
    settings = {
        zls = {
            build_on_save = true,
            build_on_save_step = "check",
        }
    }
})

vim.diagnostic.config({
    float = { border = "single" },
    virtual_text = true,
})

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local map = function(modes, key, cmd)
            vim.keymap.set(modes, key, cmd, { buffer = event.buf })
        end
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gq", vim.lsp.buf.format)
    end,
})
