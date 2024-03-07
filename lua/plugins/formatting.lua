return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { 'yamlfmt' },
        toml = { 'taplo' },
        markdown = { 'markdownlint-cli2' },
        python = { 'ruff_format' },
        hcl = { 'terraform_fmt' },
      },
    },
  },
}
