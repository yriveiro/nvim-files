local lspconfig = require 'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
end

lspconfig.terraformls.setup{
	on_attach = on_attach,
	cmd = {'terraform-ls', 'serve'},
	settings = {
		terraform = {
			languageServer = {
				pathToBinary = '/usr/local/bin/terraform-ls'
			}
		}
	}
}
