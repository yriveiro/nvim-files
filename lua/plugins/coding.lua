return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'chrisgrieser/cmp_yanky',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-emoji',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = 'cmp_yanky' },
        { name = 'nvim_lua' },
        { name = 'emoji' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
      }))

      opts.formatting.format = lspkind.cmp_format {
        mode = 'symbol_text',
        max_width = 50,
        ellipsis_char = '...',
        menu = {
          buffer = '[Buffer]',
          cmp_yanky = '[Yanky]',
          emoji = '[Emoji]',
          luasnip = '[LuaSnip]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[Lua]',
          path = '[Path]',
          snippets = '[snippets]',
        },
      }
    end,
  },
  {
    'folke/lazydev.nvim',
    opts = {
      library = {
        { path = 'wezterm-types', mods = { 'wezterm' } },
      },
    },
  },
}
