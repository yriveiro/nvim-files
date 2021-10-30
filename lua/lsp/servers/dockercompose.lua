local npm = require "nvim-lsp-installer.installers.npm"
local server = require 'nvim-lsp-installer.server'

local M = {}
local server_name = 'dockercompose'

-- Argo server is a custom configuration of a yamlls server.
local root_dir = server.get_server_root_path('dockercompose')

function M.get_server()
    return server.Server:new {
      name = server_name,
      root_dir = root_dir,
      installer = npm.packages { "yaml-language-server" },
      default_options = {
          cmd = { npm.executable(root_dir, "yaml-language-server"), "--stdio" },
      },
    }
end

return M
