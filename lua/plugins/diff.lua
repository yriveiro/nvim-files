return {
  'sindrets/diffview.nvim',
  cmd = 'DiffviewOpen',
  keys = {
    { '<leader>dc', '<cmd>DiffviewClose<CR>', desc = 'Diffview close' },
    { '<leader>dd', '<cmd>DiffviewToggleFiles<CR>', desc = 'Diffview toggle files' },
    { '<leader>dh', '<cmd>DiffviewFileHistory<CR>', desc = 'Diffview history' },
    { '<leader>dv', '<cmd>DiffviewOpen<CR>', desc = 'Diffview open' },
  },
}
