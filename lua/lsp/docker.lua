local lspconfig = require 'lspconfig'

lspconfig.dockerls.setup{
  cmd= {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/dockerfile/node_modules/.bin/docker-langserver', '--stdio'},
}
