local ok, lspi = pcall(require, 'nvim-lsp-installer')

if not ok then
  local u = require 'utils'
  u.nok_plugin('nvim-lsp-installer')
  return
end


lspi.setup({
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
    'sqls',
    'sumneko_lua',
    'taplo',
    'terraformls',
    'tflint',
    'yamlls',
  },
})
