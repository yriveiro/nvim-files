return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { 'yamlfmt' },
        xml = { 'lemminx' },
        toml = { 'taplo' },
        markdown = { 'markdownlint-cli2' },
        python = { 'ruff_format' },
        hcl = { 'terraform_fmt' },
        sql = { 'sqlfluff' },
        cs = { 'csharpier' },
      },
      formatters = {
        xmlformatter = {
          prepend_args = { '--blanks' },
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
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
