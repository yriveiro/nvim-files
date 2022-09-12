local ok, yapf = pcall(require, 'yapf')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'yapf'
  return
end

yapf.setup {
  style = '{based_on_style: pep8, column_limit: 119, spaces_around_default_or_named_assign: true}',
}
