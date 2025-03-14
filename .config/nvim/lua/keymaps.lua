local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --

vim.keymap.set('n', "<space>a", vim.lsp.buf.code_action)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- keep the cursor in the middle of the screen
-- half page jumping
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- search and stay in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)

-- DISABLE ARROW KEYS

-- normal mode
vim.keymap.set("n", "<up>", "<Nop>")
vim.keymap.set("n", "<down>", "<Nop>")
vim.keymap.set("n", "<left>", "<Nop>")
vim.keymap.set("n", "<right>", "<Nop>")

-- insert mode
-- vim.keymap.set("i", "<up>", "<Nop>")
-- vim.keymap.set("i", "<down>", "<Nop>")
-- vim.keymap.set("i", "<left>", "<Nop>")
-- vim.keymap.set("i", "<right>", "<Nop>")

-- visual mode
vim.keymap.set("v", "<up>", "<Nop>")
vim.keymap.set("v", "<down>", "<Nop>")
vim.keymap.set("v", "<left>", "<Nop>")
vim.keymap.set("v", "<right>", "<Nop>")

-- command mode
vim.keymap.set("c", "<up>", "<Nop>")
vim.keymap.set("c", "<down>", "<Nop>")
vim.keymap.set("c", "<left>", "<Nop>")
vim.keymap.set("c", "<right>", "<Nop>")
