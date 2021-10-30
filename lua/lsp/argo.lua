local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local bin_name = "yaml-language-server"

if not lspconfig.argo then
  -- Create server entry in lspconfig
  configs.argo = {
    default_config = {
      cmd = {bin_name, "--stdio"},
      filetypes = { 'yaml.argo' },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*.argo.{yml,yaml}',
          },
        },
      },
    },
  }
end

lspconfig.argo.setup{}
