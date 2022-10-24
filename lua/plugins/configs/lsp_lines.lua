local ok, n = pcall(require, 'lsp_lines')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'lsp_lines'
  return
end

n.setup {}
