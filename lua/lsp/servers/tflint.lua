local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {
  settings = {
    capabilities = capabilities,
  },
}

lsp.tflint.setup(opts)
