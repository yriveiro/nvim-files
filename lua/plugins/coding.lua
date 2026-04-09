return {
  {
    'saghen/blink.cmp',
    event = 'VeryLazy',
    dependencies = {
      { 'saghen/blink.compat', lazy = true, version = false },
      { 'moyiz/blink-emoji.nvim' },
      { 'bydlw98/blink-cmp-env' },
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
        },
      },
      appearance = {
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
  {
    'folke/lazydev.nvim',
    event = 'VeryLazy',
    ft = 'lua',
    dependencies = {
      { 'DrKJeff16/wezterm-types', lazy = true },
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
  {
    'clabby/difftastic.nvim',
    cmd = { 'Difft', 'DifftPick', 'DifftPickRange', 'DifftClose', 'DifftUpdate' },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim',
    },
    opts = {
      download = true,
      vcs = 'git',
      snacks_picker = {
        enabled = true,
      },
      keymaps = {
        next_file = 'fn',
        prev_file = 'fp',
        next_hunk = 'n',
        prev_hunk = 'p',
        close = 'q',
        focus_tree = '<LocalLeader>df',
        focus_diff = '<Tab>',
        select = '<CR>',
        goto_file = 'gf',
      },
    },
  },
}
