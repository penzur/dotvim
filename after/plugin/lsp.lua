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

lspconfig.lua_ls.setup({
    on_attach = function(client)
    -- Opt out of semantic token highlighting.
    client.server_capabilities.semanticTokensProvider = nil
    end
})

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
local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
    return
end
local b = null_ls.builtins

local sources = {
    -- b.formatting.eslint_d,
    -- b.diagnostics.eslint_d,
    -- b.formatting.stylelint,
    -- b.diagnostics.stylelint,
    -- b.formatting.clang_format,
    b.formatting.stylua,
    b.formatting.prettier.with {
        condition = function(utils)
            return utils.root_has_file { ".prettierrc" }
        end,
        prefer_local = "node_modules/.bin",
    },
}
local null = require('null-ls')
null.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}
lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
