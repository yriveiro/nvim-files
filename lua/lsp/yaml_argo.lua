local lspconfig = require 'lspconfig'
local server = '/yaml/node_modules/.bin/yaml-language-server'


lspconfig.yamlls.setup{
  filetypes = { 'yaml.argo' },
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*.argo.{yml,yaml}',
      },
    },
    cmd = { os.getenv("HOME") .. LSPServersPath .. server,'--stdio' },
  },
}
