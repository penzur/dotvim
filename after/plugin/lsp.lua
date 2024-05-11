local lsp = require('lsp-zero').preset({ manage_nvim_cmp = false })
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'gopls',
        'pylsp',
        'lua_ls',
        'rust_analyzer',
        'sqlls',
        'emmet_language_server',
        'cssls',
        'stylelint_lsp',
        'tailwindcss',
    }
})

lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities())
lsp_defaults.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- local lsp_format_on_save = function(bufnr)
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd('BufWritePre', {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--             vim.lsp.buf.format()
--         end,
--     })
-- end

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

local on_attach = function(_, buffnr)
    lsp.default_keymaps({ buffer = buffnr })
end

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['rust_analyzer'] = { 'rust' },
--         ['tsserver'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
--         ['goplst'] = { 'go' },
--     }
-- })
--
lsp.setup()

lspconfig.lua_ls.setup({})

-- tsserver
lspconfig.tsserver.setup({
    on_attach = on_attach,
    -- flags = lspconfig.lsp_flags,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

-- go
lspconfig.gopls.setup({
    on_attach = on_attach,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})

-- rust
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                features = {
                    "client",
                    "server"
                }
            },
        }
    }
})

-- ruby
lspconfig.solargraph.setup({
    on_attach = on_attach,
    cmd = { "solargraph", "stdio" },
})

-- null-ls
local null = require('null-ls')
null.setup({
    on_attach = on_attach,
    sources = {
        null.builtins.formatting.prettier
    }
})
