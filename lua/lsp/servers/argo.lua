local lspconfig = require 'lspconfig'
local npm = require "nvim-lsp-installer.installers.npm"
local server = require 'nvim-lsp-installer.server'

local M = {}
local server_name = 'argo'

-- Argo server is a custom configuration of a yamlls server.
local root_dir = server.get_server_root_path(server_name)

function M.get_server()
    return server.Server:new {
      name = server_name,
      root_dir = root_dir,
      installer = npm.packages { "yaml-language-server" },
      default_options = {},
    }
end

function M.get_opts()
  return {
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      cmd = { npm.executable(root_dir, "yaml-language-server"), "--stdio" },
      filetypes = { 'yaml.argo' },
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*.argo.{yml,yaml}',
          },
        },
      },
    }
end

return M
