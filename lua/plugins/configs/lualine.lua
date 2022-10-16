require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      'lsp_progress',
    }
  },
  extensions = {
    'neo-tree',
    'nvim-dap-ui',
    'quickfix',
  },
  globalstatus = true,
}
