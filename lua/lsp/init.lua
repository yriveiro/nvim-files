local servers = {
  'bashls',
  'dockerls',
  'gopls',
  'jdtls',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sqls',
  'sumneko_lua',
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
