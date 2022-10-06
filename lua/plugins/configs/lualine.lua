require('lualine').setup {
	sections = {
		lualine_c = {
			'lsp_progress'
		}
	},
  extensions = {
    'neo-tree',
    'nvim-dap-ui',
    'quickfix',
  }
}
