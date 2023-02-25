return {
  'rcarriga/nvim-notify',
  lazy = true,
  config = function()
    vim.o.termguicolors = true, 
require('notify').setup {}
  end,
}
