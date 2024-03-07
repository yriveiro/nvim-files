return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'chrisgrieser/cmp_yanky',
      'hrsh7th/cmp-nvim-lua',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'

      opts.sources =
        cmp.config.sources(vim.list_extend(opts.sources, { { name = 'cmp_yanky' }, { name = 'nvim_lua' } }))

      opts.formatting.format = lspkind.cmp_format {
        mode = 'symbol_text',
        max_width = 50,
        ellipsis_char = '...',
        menu = {
          buffer = '[Buffer]',
          cmp_yanky = '[Yanky]',
          luasnip = '[LuaSnip]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[Lua]',
          snippets = '[snippets]',
          path = '[Path]',
        },
      }
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    opts = {
      markdown = {
        fat_headline_upper_string = '▃',
        fat_headline_lower_string = '▀',
        headline_highlights = { 'NorgHeadline' },
        codeblock_highlight = 'NorgCodeBlock',
        dash_highlight = 'NorgDash',
      },
      norg = {
        fat_headlines = false,
        headline_highlights = {},
      },
    },
  },
}
