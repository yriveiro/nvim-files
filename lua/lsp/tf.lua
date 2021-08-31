local lspconfig = require 'lspconfig'

lspconfig.terraformls.setup{
	cmd = {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/terraform/terraform-ls', 'serve'},
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
