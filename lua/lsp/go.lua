local lspconfig = require 'lspconfig'

local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('gopls')
if ok then
  server:on_ready(function ()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

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

    server:setup(opts)
  end)
  if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
  end
end
