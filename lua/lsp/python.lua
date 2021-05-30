local lspconfig = require 'lspconfig'

lspconfig.pyright.setup{
  cmd= {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/python/node_modules/.bin/pyright-langserver', '--stdio'},
}
