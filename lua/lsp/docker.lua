local lspconfig = require 'lspconfig'
local server = '/dockerfile/node_modules/.bin/docker-langserver'

lspconfig.dockerls.setup{
  filetypes =  { "dockerfile", "Dockerfile" },
  cmd= { os.getenv("HOME") .. LSPServersPath .. server, '--stdio' },
}
