local lspconfig = require 'lspconfig'

lspconfig.bashls.setup {
	cmd= {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/bash/node_modules/.bin/bash-language-server', 'start'}
}
