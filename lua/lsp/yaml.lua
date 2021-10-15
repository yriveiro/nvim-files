local lspconfig = require 'lspconfig'
local server = '/yaml/node_modules/.bin/yaml-language-server'


lspconfig.yamlls.setup{
  filetypes = { 'yaml', 'helm', 'yml' },
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = "*.argo.yaml",
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {"docker-compose.yml", "docker-compose.yaml"},
        kubernetes = {"*.yml", "*.yaml"},
      },
    },
    cmd = { os.getenv("HOME") .. LSPServersPath .. server,'--stdio' },
  },
}
