local lspconfig = require 'lspconfig'
local server = '/yaml/node_modules/.bin/yaml-language-server'

lspconfig.yamlls.setup{
  cmd = { os.getenv("HOME") .. LSPServersPath .. server,'--stdio' },
  filetypes = { 'yaml', 'helm', 'yml' },
  settings = {
    yaml = {
      schemas = {
        kubernetes = '*.{yaml,yml}',
      },
    },
  },
}
