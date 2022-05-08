local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local opts = {
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				fieldalignment = true,
				nilness = true,
				shadow = true,
				unusedwrite = true,
			},
			staticcheck = true,
		},
	},
}

lsp.gopls.setup(opts)
