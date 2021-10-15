local lspconfig = require 'lspconfig'
local server = '/terraform/terraform-ls'

lspconfig.terraformls.setup{
	cmd = {os.getenv("HOME") .. LSPServersPath .. server, 'serve'},
	settings = {
		terraformls = {
			experimentalFeatures = {
				validateOnSave = true
			}
		},
		terraform = {
			languageServer = {
				pathToBinary = LSPServersPath .. server
			}
		}
	}
}
