local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('jsonls')
if ok then
  server:on_ready(function ()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local opts = {
      capabilities = capabilities,
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
