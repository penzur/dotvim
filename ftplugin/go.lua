vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.keymap.set('n', '<C-x>', ':!go run .<cr>')

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        -- First organize imports
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
        if result and result[1] then
            local actions = result[1].result
            if actions and actions[1] then
                vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
            end
        end

        -- Then format the buffer
        vim.lsp.buf.format()
    end,
})
