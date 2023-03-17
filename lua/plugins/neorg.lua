return {
  'nvim-neorg/neorg',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      lazy = true,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = true,
    },
    {
      'folke/zen-mode.nvim',
      lazy = true,
    },
  },
  build = ':Neorg sync-parsers',
  opts = {
    load = {
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.presenter'] = {
        config = {
          zen_mode = 'zen-mode',
        },
      }, -- Presentations
      ['core.norg.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/.neorg/notes',
          },
        },
      },
    },
  },
}
