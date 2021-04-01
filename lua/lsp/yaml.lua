local lspconfig = require 'lspconfig'

lspconfig.yamlls.setup{
  filetypes = { 'yaml', 'helm' }
}
