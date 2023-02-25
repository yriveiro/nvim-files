return {
  'nathom/filetype.nvim',
  lazy = false,
  init = function()
    vim.cmd 'runtime! autoload/dist/ft.vim'
  end,
}
