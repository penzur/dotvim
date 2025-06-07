vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.keymap.set('n', '<C-x>', ':!go run .<cr>')

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        -- Format the buffer
        vim.lsp.buf.format({ async = false })

        -- Organize imports (only if LSP is ready)
        local has_null_ls, null_ls = pcall(require, "null-ls")
        local has_nls_sources = has_null_ls and #null_ls.get_sources() > 0

        -- Only organize imports if an LSP client that can handle it is ready
        if has_nls_sources or vim.lsp.get_active_clients({ bufnr = 0 })[1] then
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }

            -- Call organizeImports synchronously
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
            for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
                    else
                        vim.lsp.buf.execute_command(r.command)
                    end
                end
            end
        end
    end,
})
