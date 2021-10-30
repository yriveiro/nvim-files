local lspconfig = require 'lspconfig'
local server = '/yaml/node_modules/.bin/yaml-language-server'

lspconfig.yamlls.setup{
  filetypes = { 'yaml', 'helm', 'yml' },
  settings = {
    yaml = {
      schemas = {
        kubernetes = '*.{yaml,yml}',
      },
    },
    cmd = { os.getenv("HOME") .. LSPServersPath .. server,'--stdio' },
  },
}
