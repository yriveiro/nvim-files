local lspconfig = require 'lspconfig'
local server = '/yaml/node_modules/.bin/yaml-language-server'


lspconfig.yamlls.setup{
  filetypes = { 'yaml.docker-compose' },
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {"docker-compose.yml", "docker-compose.yaml"},
      },
    },
    cmd = { os.getenv("HOME") .. LSPServersPath .. server,'--stdio' },
  },
}
