local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('argo')
if ok then
  server:on_ready(function ()
    local opts = {
      cmd = {'yaml-language-server', '--stdio'},
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
      }
    }
    server:setup(opts)
  end)
  if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
  end
end
