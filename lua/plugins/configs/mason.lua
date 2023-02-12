local ok, m = pcall(require, 'mason')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'mason.nvim'
  return
end

local ok, mlsp = pcall(require, 'mason-lspconfig')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'lspconfig'
  return
end

m.setup()

mlsp.setup {
  automatic_installation = true,
  ensure_installed = {
    'bashls',
    'dockerls',
    'jsonls',
    'rust_analyzer',
    'sumneko_lua',
    'yamlls',
    'gopls',
    'grammarly',
    'jdtls',
    'jsonls',
    'lua_lsp',
    'sqls',
    'taplo',
    'terraformls',
    'tflint',
    'yamlls',
  },
}
