local ok, n = pcall(require, 'neogen')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'neogen'
  return
end

n.setup {
  snippet_engine = 'luasnip',
  languages = {
    python = {
      template = {
        annotation_convention = 'numpydoc', -- for a full list of annotation_conventions, see supported-languages below,
      },
    },
  },
}
