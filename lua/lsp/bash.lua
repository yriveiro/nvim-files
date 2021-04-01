local lspconfig = require 'lspconfig'

lspconfig.bashls.setup {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash', 'conf' },
}
