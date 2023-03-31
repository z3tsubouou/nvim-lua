local status, saga = pcall(require, "lspsaga")
if (not status) then
  return
end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  },
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
})

local opts = {
  noremap = true,
  silent = true
}
local opts2 = {
  noremap = true,
  silent = true,
  remap = true
}
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- Todo: hover hiisen uyed noice notification garch irj baigaag boliulalh
vim.keymap.set('n', 'gk', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', 'gtt', '<Cmd>Lspsaga term_toggle<CR>', opts)
vim.keymap.set('n', 'gol', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set("n", "gob", "<C-O>", opts2)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
