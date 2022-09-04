local ok, colorizer = pcall(require, 'colorizer')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'colorizer'
  return
end

colorizer.setup { '*' }
