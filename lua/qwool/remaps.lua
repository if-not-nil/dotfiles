local map = vim.keymap.set

map({ "n", "x" }, "<S-w>", "<C-w>")

-- map({ "n", "x" }, "<leader>e", ":NnnPicker<cr>", { desc = "file picker" })

-- map('n', '<leader>?', '<cmd>Pick oldfiles<cr>', {desc = 'Search file history'})
-- map('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
-- map({ "n", "x" }, "<leader>tn", "<cmd>tabnew<cr>", { desc = "new tab" })
-- map({ "n", "x" }, "<leader>t<Tab>", "<cmd>tabprev<cr>", { desc = "previous tab" })
-- map({ "n", "x" }, "<leader>tw", "<cmd>tabclose<cr>", { desc = "close tab" })

map("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "close buffer" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true })

map({ "n", "x" }, ";", ":")
map("n", "<leader>w", ":w<cr>", { desc = "write" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
map({ "n", "x" }, "U", vim.cmd.redo)

map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "Q", "<nop>")

-- navigate thru errors
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

-- this is for plugins pls organize it better when u can
-- map({ "n", "x" }, "<leader>fm", function()
-- 	require("conform").format({ lsp_fallback = true })
-- end, { desc = "general format file" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
