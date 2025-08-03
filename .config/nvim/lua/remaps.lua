local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- window
map({ "n", "x" }, "<Tab>", "<cmd>bnext<CR>", { desc = "next buffer", noremap = true })
map({ "n", "x" }, "<S-Tab>", "<cmd>bprevious<CR>", { desc = "previous buffer", noremap = true })
map({ "n", "x" }, "<leader>w", ":w<cr>", { desc = "write buffer" })
map('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>Q', ':bd!<CR>', { desc = 'Force close buffer' })

map("t", "<C-w>", "<C-\\><C-n>")

map("n", "<leader>ll", function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spell check" })


-- almost zen mode
map("n", "<leader>z", function()
    if vim.o.laststatus == 2 or vim.o.laststatus == 3 then
        vim.o.laststatus = 0
        vim.o.cmdheight = 0
    else
        vim.o.laststatus = 2
        vim.o.cmdheight = 1
    end
end)


-- clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste without yanking" })

-- movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

map({ "n", "x" }, "U", vim.cmd.redo, { desc = "redo" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up
map("n", "J", "mzJ`z", { desc = "join lines and keep cursor position" })
-- map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "next quickfix item" })
-- map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "previous quickfix item" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear search highlights" })

-- why does it not have the emacs keys by default
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")
-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- idk why but it changes based on the filetype???
-- vim.opt.makeprg = "make"
map("n", "<leader>j", "<cmd>!just<CR>")

local function send_keys(keys, mode)
    local replaced = vim.api.nvim_replace_termcodes(keys, true, false, true)
    vim.api.nvim_feedkeys(replaced, mode, false)
end

-- like the best thing ever for working with raylib
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function()
        vim.keymap.set("v", "<leader>2", function()
            send_keys("sa)hi@", "v")
        end)
        vim.keymap.set("v", "<leader>3", function()
            send_keys("sa)hi@as<Right>, <Left><Left>", "v")
        end)
    end,
})
