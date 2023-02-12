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
    'gopls',
    'grammarly',
    'jdtls',
    'jsonls',
    'jsonls',
    'lua_lsp',
    'rust_analyzer',
    'sqls',
    'taplo',
    'terraformls',
    'tflint',
    'yamlls',
    'yamlls',
  },
}
