local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = "λ",
                luasnip = "⋗",
                buffer = "Ω",
                path = "🖫",
                nvim_lua = "Π",
            }

            item.menu = menu_icon[entry.source.name]

            return item
        end,
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
        {name = 'nvim_lsp_signature_help'},
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<C-j>"] = cmp_action.luasnip_supertab(),
        ["<C-k>"] = cmp_action.luasnip_shift_supertab(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<S-Tab>'] = cmp.mapping(function(fb)
            if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
            elseif require('luasnip').expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true), '')
            else
                fb()
            end
        end),
        ['<Tab>'] = cmp.mapping(function(fb)
            if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
            else
                fb()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
