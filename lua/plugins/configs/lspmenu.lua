local ok, m = pcall(require, 'lsp_menu')

if not ok then
  local u = require 'utils'
  u.nok_plugin('lsp_menu.nvim')
  return
end
