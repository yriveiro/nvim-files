return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim', 'pysan3/neorg-templates' },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = '~/notes/work',
                home = '~/notes/home',
                oss = '~/notes/oss',
                ['awesome-links'] = '~/notes/awesome-links',
              },
            },
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.export'] = {},
          ['core.ui'] = {},
          ['core.ui.calendar'] = {},
          ['external.templates'] = {},
        },
      }
    end,
  },
}
