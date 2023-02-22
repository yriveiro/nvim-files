local ok, smartcolumn = pcall(require, 'smartcolumn')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'smartcolumn'
  return
end

smartcolumn.setup {
  colorcolumn = 80,
  disabled_filetypes = { 'alpha' },
}
