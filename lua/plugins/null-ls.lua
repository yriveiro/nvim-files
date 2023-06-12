return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.npm_groovy_lint,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.yamlfmt.with({
          extra_args = {
            "-formatter",
            "retain_line_breaks=true",
          }
        }),
        null_ls.builtins.formatting.yapf,
      },
    }
  end,
}
