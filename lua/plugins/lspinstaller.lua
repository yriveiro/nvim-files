local lsp_installer = require 'nvim-lsp-installer'
local servers = require 'nvim-lsp-installer.servers'

-- Custom Servers.
local argo = require 'lsp/custom_servers/argo'

-- Register Custom Server on nvim-lsp-installer.
servers.register(argo)

--lsp_installer.on_server_ready(function(server)
  --local opts = {}
  --server:setup(opts)
--end)
