local ok, lspi = pcall(require, 'nvim-lsp-installer')

if not ok then
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
