local lspconfig = require 'lspconfig'

lspconfig.terraformls.setup{
	cmd = {'terraform-ls', 'serve'},
	settings = {
		terraform = {
			languageServer = {
				pathToBinary = '/usr/local/bin/terraform-ls'
			}
		}
	}
}
