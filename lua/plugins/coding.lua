return {
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        default = { 'emoji', 'codecompanion', 'env' },
        providers = {
          codecompanion = {
            name = 'CodeCompanion',
            module = 'codecompanion.providers.completion.blink',
            enabled = true,
          },
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = -9999, -- Tune by preference
            opts = { insert = true }, -- Insert emoji (default) or complete its name
          },
          env = {
            module = 'blink-cmp-env',
            name = 'Env',
            opts = {
              eval_on_confirm = false,
              item_kind = require('blink.cmp.types').CompletionItemKind.Variable,
              show_braces = false,
              show_documentation_window = true,
            },
          },
        },
      },
      appearance = {
        -- use_nvim_cmp_as_default = true,
        nerd_font_variant = 'MyFont Nerd Font Mono',
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { 'kind_icon', 'label', 'label_description', gap = 1 },
              { 'kind', gap = 1 },
              { 'source_name' },
            },
          },
        },
      },
    },
  },
  { 'moyiz/blink-emoji.nvim' },
  { 'bydlw98/blink-cmp-env' },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = {
      { 'gonstoll/wezterm-types', lazy = true },
    },
    opts = {
      library = {
        { path = 'wezterm-types', mods = { 'wezterm' } },
      },
    },
  },
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      pinned = true,
      win = {
        size = {
          width = 100,
        },
      },
    },
  },
}
