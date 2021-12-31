local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('yamlls')
if ok then
  server:on_ready(function ()
    local opts = {
      settings = {
        yaml = {
          schemas = require('schemastore').json.schemas {
            select = {
              'docker-compose.yml',
            },
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
