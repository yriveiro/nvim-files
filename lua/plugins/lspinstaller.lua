local argo = require 'lsp/servers/argo'
local dockercompose = require 'lsp/servers/dockercompose'
local lsp_installer = require 'nvim-lsp-installer'
local servers = require 'nvim-lsp-installer.servers'

servers.register(argo.get_server())
servers.register(dockercompose.get_server())

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == 'tsserver' then
    --     opts.root_dir = function() ... end
    -- end

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
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
