local lspconfig = require 'lspconfig'

lspconfig.terraformls.setup{
	cmd = {'terraform-ls', 'serve'},
	settings = {
		terraformls = {
			experimentalFeatures = {
				validateOnSave = true
			}
		},
		terraform = {
			languageServer = {
				pathToBinary = '/usr/local/bin/terraform-ls'
			}
		}
	}
}
