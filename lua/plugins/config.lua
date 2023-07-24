return {
  {
    name = 'config.nvim',
    priority = 999999,
    lazy = false,
    dir = '/Users/yriveiro/Development/github/config.nvim/main',
    config = function(_, opts)
      require('config').setup(opts)
    end,
    init = function()
      require('config').init()
    end,
    opts = {
      colorscheme = 'onenord',
    },
  },
}
