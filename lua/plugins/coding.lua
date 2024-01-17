return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'chrisgrieser/cmp_yanky',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = 'cmp_yanky' } }))

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
        fat_headline_lower_string = '━',
        headline_highlights = { 'HeadlinesHeadline' },
        codeblock_highlight = 'HeadlinesCodeBlock',
        dash_highlight = 'HeadlinesDash',
      },
      norg = {
        fat_headline_upper_string = '▃',
        fat_headline_lower_string = '▀',
        headline_highlights = { 'NorgHeadline' },
        codeblock_highlight = 'NorgCodeBlock',
        dash_highlight = 'NorgDash',
      },
      norg = {
        fat_headline_upper_string = '▃',
        fat_headline_lower_string = '▀',
      },
    },
  },
}
