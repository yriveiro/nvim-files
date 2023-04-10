local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  init_options = {
    clientId = os.getenv 'GRAMMARLY_API_KEY',
  },
}

lsp.grammarly.setup(opts)
