local status, saga = pcall(require, "lspsaga")
if (not status) then
  return
end

saga.setup({
  lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = false,
  },
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
})

local opts = {
  noremap = true,
  silent = true
}

-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- vim.keymap.set('n', 'gk', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- Error: start_col end_col gej aldaa garch baigaa
-- vim.keymap.set('n', 'gD', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('n', 'gca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<space>tt', '<Cmd>Lspsaga term_toggle<CR>', opts)
vim.keymap.set('n', '<space>ol', '<Cmd>Lspsaga outline<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
