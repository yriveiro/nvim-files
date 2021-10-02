local lspconfig = require 'lspconfig'
local server = '/.local/share/nvim/lspinstall/dockerfile/node_modules/.bin/docker-langserver'

lspconfig.dockerls.setup{
  filetypes =  { "dockerfile", "Dockerfile" },
  cmd= { os.getenv("HOME") .. server, '--stdio' },
}
