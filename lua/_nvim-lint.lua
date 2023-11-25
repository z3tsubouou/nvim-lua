require('lint').linters_by_ft = {
  markdown = { 'vale' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  svelte = { 'eslint_d' },
  go = { 'golangcilint' },
  python = { 'pylint' }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
