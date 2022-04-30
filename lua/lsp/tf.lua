local lsp = require 'lspconfig'
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
      codelens = {
        referenceCount = true
      }
    }
  }
}

lsp.terraformls.setup(opts)
