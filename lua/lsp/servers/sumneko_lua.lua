local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'it', 'describe', 'assert', 'before_each' },
      }
    }
  }
}

lsp.sumneko_lua.setup(opts)