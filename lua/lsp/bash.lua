local lspconfig = require 'lspconfig'

lspconfig.bashls.setup {
	cmd= {'/Users/yago.riveiro/.local/share/nvim/lspinstall/bash/node_modules/.bin/bash-language-server', 'start'}
}
