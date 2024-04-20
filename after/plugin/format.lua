vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.tsx', '*.html', '*.css', '*.jsx', '*.ts', '*.js'},
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format()
  end,
})
