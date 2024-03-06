-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
-- keymap.set("n", "<space>x", "<Cmd>:q<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", "<Cmd>tabedit<CR>")
-- keymap.set('n', 'tn', 'gt')
-- keymap.set('n', 'tb', 'gT')

-- Split window
keymap.set("n", "<space>wx", ":split<Return>", { desc = "Split window below" })
keymap.set("n", "<space>wv", ":vsplit<Return>", { desc = "Split window right" })

-- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')
--
-- Resize window
keymap.set("n", "<C-l>", "<C-w><")
keymap.set("n", "<C-h>", "<C-w>>")
keymap.set("n", "<C-k>", "<C-w>+")
keymap.set("n", "<C-j>", "<C-w>-")

-- move line
-- keymap.set("n", "J", "<Cmd>:m +1<CR>")
-- keymap.set("n", "K", "<Cmd>:m -2<CR>")
keymap.set("n", ">", ">>")
keymap.set("n", "<", "<<")

-- noh
-- keymap.set('n', 'noh', '<Cmd>:noh<CR>')
keymap.set("n", "gob", "<C-O>")
keymap.set("n", "gon", "<Tab>")

--change working space
keymap.set("n", "cd", ":cd %:p:h")

--terminal
-- keymap.set("n", "<leader>t", ":split<Return><C-w>w<Cmd>:resize 15<CR><Cmd>:term<CR>")
-- keymap.set("t", "<leader>x", "<C-\\><C-n>")

-- delete buffer
keymap.set("n", "ZZ", "<Cmd>:bdelete<CR>")

-- deisabled keys
keymap.set("n", "<A-j>", "")
keymap.set("n", "<A-k>", "")
keymap.set("n", "<space>w-", "")
keymap.set("n", "<space>w|", "")
keymap.set("n", "<space>-", "")
keymap.set("n", "<leader>|", "")
keymap.set("n", "<leader>`", "")
keymap.set("n", "<leader>K", "")
keymap.set("n", "<leader><space>", "")
