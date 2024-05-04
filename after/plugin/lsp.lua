local lsp = require('lsp-zero').preset({ manage_nvim_cmp = false })

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

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()
