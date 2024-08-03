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
        sql = { 'sqlfluff' },
      },
    },
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    opts = {
      checkbox = {
        unchecked = {
          icon = '󰄱',
        },
        checked = {
          icon = '󰱒',
        },
        custom = {
          cancel = { raw = '[~]', rendered = '󰰱', highlight = 'RenderMarkdownError' },
          followup = { raw = '[>]', rendered = '', highlight = 'RenderMarkdownFollowUp' },
        },
      },
    },
  },
}
