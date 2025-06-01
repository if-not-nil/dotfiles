return {
    "folke/snacks.nvim",
    opts = {
        -- bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },

        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },

    },
    init = function()
        vim.keymap.set("n", "<leader>E", function() Snacks.explorer() end, { desc = "files" })
        vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "smart picker" })
        vim.keymap.set("n", "<leader><Tab>", function() Snacks.picker.buffers() end, { desc = "find buffer" })
        vim.keymap.set("n", "<leader>fe", function() Snacks.picker.grep() end, { desc = "grep" })
        vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "diagnostics" })
        vim.keymap.set("n", "<leader>?", function() Snacks.picker.keymaps() end, { desc = "diagnostics" })
        vim.keymap.set("n", "<leader>.", function() Snacks.scratch.select() end, { desc = "scratch" })
    end
    -- init = function()
    --     local map = vim.keymap.set
    --
    --     map("<leader>E", function() Snacks.explorer() end)
    -- end,

    -- defining keys thru lazy nvim doesnt work for no reason
    -- keys = {
    --     { "n", "<leader>E",       function() Snacks.explorer() end },
    --     { "n", "<leader><space>", function() Snacks.picker.smart() end },
    -- }
}
