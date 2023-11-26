return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'chrisgrieser/cmp_yanky',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {}))
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    opts = {
      markdown = {
        fat_headline_upper_string = '▃',
        fat_headline_lower_string = '━',
      },
    },
  },
}
