return {
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'saghen/blink.compat', lazy = true, version = false },
    },
    opts = {
      sources = {
        default = { 'emoji' },
        compat = { 'obsidian', 'obsidian_new', 'obsidian_tags', 'avante' },
        providers = {
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
          -- avante_commands = {
          --   name = 'avante_commands',
          --   module = 'blink.compat.source',
          --   score_offset = 90, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- add avante here
              avante = {
                command = {
                  get_kind_name = function(_)
                    return 'AvanteCmd'
                  end,
                },
                mention = {
                  get_kind_name = function(_)
                    return 'AvanteMention'
                  end,
                },
              },
              kind_icons = {
                AvanteCmd = '',
                AvanteMention = '',
              },
            },
          },
          -- avante_files = {
          --   name = 'avante_files',
          --   module = 'blink.compat.source',
          --   score_offset = 100, -- ~40 points higher than LSP ()
          --   opts = {},
          -- },
          -- avante_mentions = {
          --   name = 'avante_mentions',
          --   module = 'blink.compat.source',
          --   score_offset = 1000, -- show at a higher priority than lsp
          --   opts = {},
          -- },
        },
      },
      appearance = {
        -- use_nvim_cmp_as_default = true,
        nerd_font_variant = (function()
          local hostname = io.popen('hostname'):read '*l'
          if string.sub(hostname, 1, 2) == 'MB' then
            return 'FiraCode Nerd Font Mono'
          else
            return 'MyFont Nerd Font Mono'
          end
        end)(),
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
  { 'Kaiser-Yang/blink-cmp-avante' },
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
  {
    'aznhe21/actions-preview.nvim',
    config = true,
    keys = {
      {
        '<Leader>cp',
        function()
          require('actions-preview').code_actions {}
        end,
        desc = 'Code Actions Preview',
      },
    },
  },
}
