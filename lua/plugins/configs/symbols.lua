local ok, symbols = pcall(require, 'symbols-outline')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'symbols-outline'
  return
end


symbols.setup {
  autofold_depth = 10
}
