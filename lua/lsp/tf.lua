local servers = require'nvim-lsp-installer.servers'

local server_name = 'terraformls'
local root_dir = require 'nvim-lsp-installer.server'.get_server_root_path(server_name)

local ok, server = servers.get_server(server_name)
if ok then
  server:on_ready(function ()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local opts = {
      capabilities = capabilities,
      settings = {
        ['terraform-ls'] = {
          experimentalFeatures = {
            validateOnSave = true,
            PrefillRequiredFields = true,
          },
          terraformExecPath = '/usr/local/bin/terraform',
        },
        terraform = {
          languageServer = {
            pathToBinary = root_dir
          },
          codelens = {
            referenceCount = true
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
