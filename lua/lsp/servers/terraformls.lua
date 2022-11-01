local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  filetypes = { 'terraform', 'hcl' },
  cmd = { 'terraform-ls',
    'serve',
    -- '-cpuprofile=/tmp/terraform-ls-cpu.prof',
    -- '-memprofile=/tmp/terraform-ls-mem.prof',
    -- '-log-file=/tmp/terraform-ls.log',
  },
  settings = {
    ['terraform-ls'] = {
      experimentalFeatures = {
        validateOnSave = true,
        PrefillRequiredFields = true,
      },
      terraform = {
        path = '/usr/local/bin/terraform',
        logFilePath = '~/.cache/nvim/terraformls.log',
        timeout = '120s',
      },

    },
  },
}

lsp.terraformls.setup(opts)
