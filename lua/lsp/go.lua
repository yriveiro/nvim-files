local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.gopls.setup{
	capabilities = capabilities,
	cmd = {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/go/gopls', "serve"},
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
