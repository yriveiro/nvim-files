local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local bin_name = "yaml-language-server"

if not lspconfig.dockercompose then
  -- Create server entry in lspconfig
  configs.dockercompose = {
    default_config = {
      cmd = {bin_name, "--stdio"},
      filetypes = { 'yaml.docker-compose' },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose.{yml,yaml}',
          },
        },
      },
    },
  }
end

lspconfig.dockercompose.setup{}
