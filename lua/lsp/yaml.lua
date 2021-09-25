local lspconfig = require 'lspconfig'
local server = '/.local/share/nvim/lspinstall/yaml/node_modules/.bin/yaml-language-server'


lspconfig.yamlls.setup{
  filetypes = { 'yaml', 'helm', 'yml' },
  settings = {
    yaml = {
      schemas = {
        kubernetes = {"*.yml", "*.yaml"},
        ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = "*.argo.yaml",
      },
    },
    cmd = {
      os.getenv("HOME") .. server,
      '--stdio'
    },
  },
}
