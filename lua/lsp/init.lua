local servers = {
  'bashls',
  'dockerls',
  'gopls',
  'grammarly',
  'jdtls',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sqls',
  'lua_ls',
  'taplo',
  'terraformls',
  'tflint',
  'tsserver',
  'yamlls',
}

for _, server in ipairs(servers) do
  require('lsp.servers.' .. server)
end

-- Load diagnostic settings
require 'lsp.diagnostics'
