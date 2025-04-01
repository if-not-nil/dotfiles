vim.keymap.set({"n", "x"}, "<leader>e", ":NnnPicker<cr>")
vim.keymap.set({ "n", "x" }, "<leader>tn", "<cmd>tabnew<cr>")
vim.keymap.set({ "n", "x" }, "<leader>t<Tab>", "<cmd>tabprev<cr>")
vim.keymap.set({ "n", "x" }, "<leader>tw", "<cmd>tabclose<cr>")

vim.keymap.set('n', '<leader>q', '<cmd>bdelete<cr>', { desc = 'close buffer' })

vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true, desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { noremap = true, desc = 'Previous buffer' })

vim.keymap.set({ "n", "x" }, ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set('x', 'p', '"_dP', { noremap = true, desc = 'Paste without copying deleted text' })
vim.keymap.set({ "n", "x" }, "U", vim.cmd.redo)

