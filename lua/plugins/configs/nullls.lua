local ok, null_ls = pcall(require, 'null-ls')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'null-ls'
  return
end


null_ls.setup {
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yapf,
    },
}
