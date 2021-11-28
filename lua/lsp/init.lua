require 'lsp.go'
require 'lsp.json'
require 'lsp.lua'
require 'lsp.tf'

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

if not lspconfig.argo then
  configs.argo = { default_config = {} }
end

lspconfig.argo.setup{
  autostart = false,
}

if not lspconfig.dockercompose then
  configs.dockercompose = { default_config = {} }
end

lspconfig.dockercompose.setup{
  autostart = false,
}
