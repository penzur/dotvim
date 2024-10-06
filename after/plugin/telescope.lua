local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-g>', builtin.live_grep, {})
vim.keymap.set('n', '<c-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<c-f>', function ()
    builtin.lsp_document_symbols({
        symbols = {'function', 'method'}
    })
end)
vim.keymap.set('n', '<leader>f', function ()
    builtin.lsp_document_symbols({
        ignore_symbols = {'function', 'method', 'property'}
    })
end)

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-x>'] = actions.delete_buffer,
            },
        },
    },
})
