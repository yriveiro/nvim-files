local lspconfig = require 'lspconfig'
local server = '/python/node_modules/.bin/pyright-langserver'

lspconfig.pyright.setup{
  cmd= { os.getenv("HOME") .. LSPServersPath .. server, '--stdio' },
}
