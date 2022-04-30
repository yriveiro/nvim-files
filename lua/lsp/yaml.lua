local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require('schemastore').json.schemas {
        select = {
          'docker-compose.yml',
        },
      },
    },
  }
}


lsp.yamlls.setup(opts)
