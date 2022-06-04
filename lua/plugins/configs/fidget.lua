local ok, fidget = pcall(require, 'fidget')

if not ok then
  local u = require 'utils'
  u.nok_plugin('fidget')
  return
end

fidget.setup {}
