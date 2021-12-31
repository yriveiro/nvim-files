local lsp = require 'lspconfig'
local configs = require 'lspconfig.configs'

-- Check if the config is already defined (useful when reloading this file)
if not configs.argo then
  configs.argo = {
    default_config = {
			single_file_support = true,
      filetypes = {'yaml.argo'};
      docs = {},
      root_dir = function(fname)
        return lsp.util.find_git_ancestor(fname)
      end,
      settings = {
        -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
        redhat = {
          telemetry = {
            enabled = false
          }
        },
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*.argo.{yml,yaml}',
          },
        },
      },
    },
  }
end

lsp.argo.setup{}
