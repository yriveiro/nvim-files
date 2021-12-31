local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('sumneko_lua')
if ok then
  server:on_ready(function ()
    local opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          }
        }
      }
    }
    server:setup(opts)
  end)
  if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
  end
end
