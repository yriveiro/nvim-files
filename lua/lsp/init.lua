local servers = {
  'bashls',
  'dockerls',
  'gopls',
  'grammarly',
  'groovyls',
  'jdtls',
  'jsonls',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'sqls',
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
