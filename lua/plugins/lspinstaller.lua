local lsp_installer = require 'nvim-lsp-installer'
local servers = require 'nvim-lsp-installer.servers'

-- Custom Servers.
local argo = require 'lsp/servers/argo'
local yaml = require 'lsp/servers/yaml'
local dockercompose = require 'lsp/servers/dockercompose'

servers.register(argo.get_server())
servers.register(dockercompose.get_server())

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { 'vim' }
        }
      }
    }
  end

  if server.name == 'yamlls' then
    opts = yaml.get_opts()
  end

  if server.name == 'dockercompose' then
    opts = dockercompose.get_opts()
  end

  if server.name == 'argo' then
    opts = argo.get_opts()
  end

  server:setup(opts)
end)
