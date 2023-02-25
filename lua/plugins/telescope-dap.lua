return {
  'nvim-telescope/telescope-dap.nvim',
  dependencies = {
    {
      'nvim-telescope/telescope.nvim',
      lazy = true,
    },
    {
      'mfussenegger/nvim-dap',
      lazy = true,
    },
  },
}
