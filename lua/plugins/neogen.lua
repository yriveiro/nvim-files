return {
  'danymat/neogen',
  lazy = true,
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = true,
    },
  },
  config = function()
    require('neogen').setup {}
  end,
}
