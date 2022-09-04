local ok, n = pcall(require, 'neogen')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'neogen'
  return
end

n.setup {}
