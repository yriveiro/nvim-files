local ok, yapf = pcall(require, 'yapf')

if not ok then
  local u = require 'utils'
  u.nok_plugin('yapf')
  return
end

yapf.setup {}
