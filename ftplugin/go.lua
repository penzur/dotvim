vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.keymap.set('n', '<C-x>', ':!go run .<cr>')

-- Auto-formatting with goimports on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.go",
    command = "silent! !goimports -w %"
})
