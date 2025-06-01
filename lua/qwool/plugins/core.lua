return {
    "nvim-lua/plenary.nvim",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        setup = function()
            require("which-key").register({
                ["<S-w>"] = { "<C-w>", "window command" },
            }, { prefix = "<leader>" })
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    -- {
    --     "luukvbaal/nnn.nvim",
    --     opts = {
    --         replace_netrw = "explorer"
    --     }
    -- },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     main = "ibl",
    --     opts = {
    --         indent = { char = "┊" },
    --     },
    -- }
}
