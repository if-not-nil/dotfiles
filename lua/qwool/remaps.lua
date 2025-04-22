local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- window
map({ "n", "x" }, "<S-w>", "<C-w>", { desc = "window command mode" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "next buffer", noremap = true })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "previous buffer", noremap = true })
map({ "n", "x" }, "<leader>w", ":w<cr>", { desc = "write buffer" })
map("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "close current buffer" })

-- files
map("n", "<C-s>", "<cmd>w<CR>", { desc = "save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy entire file to clipboard" })

-- clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste without yanking" })

-- movement
map({ "n", "x" }, "U", vim.cmd.redo, { desc = "redo" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })
map("n", "J", "mzJ`z", { desc = "join lines and keep cursor position" })
map("n", "Q", "<nop>", { desc = "disable Ex mode" })
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "next quickfix item" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "previous quickfix item" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear search highlights" })
map({ "n", "x" }, ";", ":")

-- run task
vim.keymap.set("n", "<leader>r", function()
	local output = vim.fn.system("./task.sh")
	vim.notify(output, vim.log.levels.INFO, { title = "task.sh Output" })
end, { desc = "run task.sh and show output" })
-- map({ "n", "x" }, "<leader>e", ":NnnPicker<cr>", { desc = "file picker" })
-- map("n", "<leader>?", "<cmd>Pick oldfiles<cr>", { desc = "search file history" })
-- map("n", "<leader><space>", "<cmd>Pick buffers<cr>", { desc = "search open buffers" })
-- map({ "n", "x" }, "<leader>tn", "<cmd>tabnew<cr>", { desc = "open new tab" })
-- map({ "n", "x" }, "<leader>t<Tab>", "<cmd>tabprev<cr>", { desc = "previous tab" })
-- map({ "n", "x" }, "<leader>tw", "<cmd>tabclose<cr>", { desc = "close tab" })
-- vim.keymap.set("n", "p", "p=`]<CR>gv=gv", { desc = "paste and reselect", noremap = true, silent = true })
-- vim.keymap.set("n", "P", "P=`]<CR>gv=gv", { desc = "paste before and reselect", noremap = true, silent = true })
