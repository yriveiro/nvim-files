local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local opts = {
  settings = {
    capabilities = capabilities,
  }
}

lsp.dockerls.setup(opts)
