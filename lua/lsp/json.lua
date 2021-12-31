local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('jsonls')
if ok then
  server:on_ready(function ()
    local opts = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
          end
        },
      },
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    }
    server:setup(opts)
  end)
  if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
  end
end
