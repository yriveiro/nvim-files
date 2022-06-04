local ok, cmp = pcall(require, 'cmp')

if not ok then
  local u = require 'utils'
  u.nok_plugin('cmp')
  return
end

local icons = {
    Class = 'ﴯ',
    Color = '',
    Constant = '',
    Constructor = '⌘',
    Enum = '',
    EnumMember = '',
    Event = '',
    Field = 'ﰠ',
    File = '',
    Folder = '',
    Function = '',
    Interface = '',
    Keyword = '',
    Method = '',
    Module = '',
    Operator = '',
    Property = 'ﰠ',
    Reference = '',
    Snippet = '',
    Struct = 'פּ',
    Text = '',
    TypeParameter = '',
    Unit = '',
    Value = '',
    Variable = '',
}

local menu = {
  buffer = 'Buffer',
  nvim_lsp = 'LSP',
  vsnip = 'VSnip',
  nvim_lua = 'Lua',
  path = 'Path',
  cmdline = 'Command',
  nvim_lsp_signature_help = 'LSP Signature Help',
  cmdline_history = 'Command History',
}

cmp.setup {
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
    confirmation = {
        get_commit_characters = function()
            return {}
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = require'lspkind'.cmp_format({
          mode = 'symbol_text', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          menu = menu,
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]

            return vim_item
          end
        })
    },
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<C-s>'] = cmp.mapping.complete({
          config = {
            sources = {
              { name = 'nvim_lsp' },
              { name = 'vsnip' },
            }
          }
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-q>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true),
                    '',
                    true
                )
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true),
                    '',
                    true
                )
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
    },
    preselect = cmp.PreselectMode.None,
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'path' },
        { name = 'cmdline_history' },
    }),
})
