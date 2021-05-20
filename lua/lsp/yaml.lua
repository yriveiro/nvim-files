local lspconfig = require 'lspconfig'

lspconfig.yamlls.setup{
  cmd= {'/Users/yago.riveiro/.local/share/nvim/lspinstall/yaml/node_modules/.bin/yaml-language-server', '--stdio'},
  filetypes = { 'yaml', 'helm', 'yml' }
}
