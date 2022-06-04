local ok, c = pcall(require, 'nvim_comment')

if not ok then
  local u = require 'utils'
  u.nok_plugin('nvim_comment')
  return
end

c.setup {}
