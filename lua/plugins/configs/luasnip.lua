local ok, luasnip = pcall(require, 'luasnip')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'luasnip'
  return
end

require('luasnip.loaders.from_vscode').lazy_load()
