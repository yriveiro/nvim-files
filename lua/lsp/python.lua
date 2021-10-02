local lspconfig = require 'lspconfig'
local server = '/.local/share/nvim/lspinstall/python/node_modules/.bin/pyright-langserver'

lspconfig.pyright.setup{
  cmd= { os.getenv("HOME") .. server, '--stdio' },
}
