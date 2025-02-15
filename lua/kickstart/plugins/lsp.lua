return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim",       opts = {} },
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                -- Find references for the word under your cursor.
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                map(
                    "<leader>ws",
                    require("telescope.builtin").lsp_dynamic_workspace_symbols,
                    "[W]orkspace [S]ymbols"
                )

                map("<leader>rn", ":IncRename ", "[R]e[n]ame")

                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "[T]oggle Inlay [H]ints")
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            -- clangd = {},
            gopls = {
                staticcheck = true,
            },
            -- pyright = {},
            rust_analyzer = {},
            eslint = {
                settings = {
                    experimental = {
                        useFlatConfig = false, -- Enable flat config mode
                    },
                },
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            },
            ts_ls = {},
            pylsp = {},
            html = {},

            lua_ls = {
                -- cmd = {...},
                -- filetypes = { ...},
                -- capabilities = {},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },

            emmet_ls = {
                filetypes = {
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    "svelte",
                    "pug",
                    "typescriptreact",
                    "vue",
                },
                init_options = {
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                            ["bem.enabled"] = true,
                        },
                    },
                },
            },
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers or {}),
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
