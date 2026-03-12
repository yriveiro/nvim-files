return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { 'yamlfmt' },
        xml = { 'lemminx' },
        toml = { 'taplo' },
        markdown = { 'rumdl' },
        python = {
          -- To fix auto-fixable lint errors.
          'ruff_fix',
          -- To run the Ruff formatter.
          'ruff_format',
          -- To organize the imports.
          'ruff_organize_imports',
        },
        hcl = { 'terraform_fmt' },
        sql = { 'sqruff' },
        cs = { 'csharpier' },
      },
      formatters = {
        xmlformatter = {
          prepend_args = { '--blanks' },
        },
        yamlfmt = {
          command = 'yamlfmt',
          args = { '--formatter', 'retain_line_breaks=true' },
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
      completions = {
        lsp = { enabled = true },
        blink = { enabled = true },
      },
    },
  },
}
