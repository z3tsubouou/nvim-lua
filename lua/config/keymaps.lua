-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- keymap.set("n", "x", '"_x', { desc = "Delete character" })
-- keymap.set("n", "<space>x", "<Cmd>:q<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>", { desc = "Increment" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
-- keymap.set("n", "<leader>t", "", { desc = "New terminal tab" })
-- keymap.set("n", "<leader>te", "<Cmd>tabnew +term<CR>", { desc = "New terminal buffer tab" })
-- keymap.set("n", "<leader>tn", "<Cmd>term<CR>", { desc = "New terminal tab" })
-- keymap.set('n', 'tn', 'gt')
-- keymap.set('n', 'tb', 'gT')

-- Split window
-- keymap.set("", "<leader>wx", "<cmd>split<CR>", { desc = "Split window below" })
-- keymap.set("", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split window right" })
-- keymap.set("", "<leader>wn", "<cmd>cnext<CR>", { desc = "Quicklist next" })
-- keymap.set("", "<leader>wp", "<cmd>cprev<CR>", { desc = "Quicklist prev" })

-- Move window
-- keymap.set('n', '<leader>', '<C-w>w')
-- keymap.set("", "<leader>wh", "<C-w>h", { desc = "Move to window left" })
-- keymap.set("", "<leader>wk", "<C-w>k", { desc = "Move to window up" })
-- keymap.set("", "<leader>wj", "<C-w>j", { desc = "Move to window down" })
-- keymap.set("", "<leader>wl", "<C-w>l", { desc = "Move to window right" })
--
-- Resize window
keymap.set("n", "<C-l>", "<C-w><", { desc = "Resize window left" })
keymap.set("n", "<C-h>", "<C-w>>", { desc = "Resize window right" })
keymap.set("n", "<C-k>", "<C-w>+", { desc = "Resize window up" })
keymap.set("n", "<C-j>", "<C-w>-", { desc = "Resize window down" })

-- escape

keymap.set("i", "jk", "<Esc>", { noremap = true })

-- move line
-- keymap.set("n", "J", "<Cmd>:m +1<CR>")
-- keymap.set("n", "K", "<Cmd>:m -2<CR>")
-- keymap.set("n", ">", ">>", { noremap = true })
-- keymap.set("n", "<", "<<", { noremap = true })

-- noh
-- keymap.set('n', 'noh', '<Cmd>:noh<CR>')
-- keymap.set("n", "gob", "<C-O>", { noremap = true })
-- keymap.set("n", "gon", "<Tab>", { noremap = true })

--change working space
-- keymap.set("n", "cd", ":cd %:p:h")

--terminal
-- keymap.set("n", "<leader>t", ":split<Return><C-w>w<Cmd>:resize 15<CR><Cmd>:term<CR>")
-- keymap.set("t", "<leader>x", "<C-\\><C-n>")

-- delete buffer
-- keymap.set("n", "ZZ", "<Cmd>:bdelete<CR>", { desc = "Delete buffer" })

-- deisabled keys
keymap.del("n", "<space>-")
keymap.del("n", "<leader>|")
keymap.del("n", "<leader>`")
keymap.del("n", "<leader>K")
