local lspconfig = require 'lspconfig'

lspconfig.yamlls.setup{
  cmd= {os.getenv("HOME") .. '.local/share/nvim/lspinstall/yaml/node_modules/.bin/yaml-language-server', '--stdio'},
  filetypes = { 'yaml', 'helm', 'yml' }
}
