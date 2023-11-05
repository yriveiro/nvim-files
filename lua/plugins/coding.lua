return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'chrisgrieser/cmp_yanky',
    },
    opts = function()
      local cmp = require 'cmp'
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'cmp_yanky' },
      }, {
        { name = 'buffer' },
      })
    end,
  },
}
