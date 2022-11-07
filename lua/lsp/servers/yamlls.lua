local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  settings = {
    yaml = {
      format = { enable = true },
      validate = true,
      completion = true,
      hover = true,
      schemas = {
        ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '**/argo/**.yaml',
      },
    },
  },
}

lsp.yamlls.setup(opts)
