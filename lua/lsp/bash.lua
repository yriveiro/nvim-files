local lspconfig = require 'lspconfig'
local server = '/bash/node_modules/.bin/bash-language-server'

lspconfig.bashls.setup {
    cmd = { os.getenv("HOME") .. LSPServersPath .. server, 'start' },
}
