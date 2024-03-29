local api = require "nvim-tree.api"

local function my_on_attach(_)
  local local_api = require "nvim-tree.api"
  -- local function opts(desc)
  --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end
  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<CR>', local_api.node.open.edit, {})
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end


require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
    side = 'right',
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


vim.keymap.set('n', '<C-n>', api.tree.toggle, {})
vim.keymap.set('n', '<C-f>', api.tree.focus, {})
