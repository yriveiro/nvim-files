local lspconfig = require 'lspconfig'
local server = '/.local/share/nvim/lspinstall/bash/node_modules/.bin/bash-language-server'

lspconfig.bashls.setup {
    cmd = { os.getenv("HOME") .. server, 'start' },
}
