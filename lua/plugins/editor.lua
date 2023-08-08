return {
  -- Custom plugins
  {
    'mbbill/undotree',
    event = 'VeryLazy',
  },
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        lazy = true,
      },
      {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
      },
    },
    config = true,
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } },
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require('colorizer').setup { '*' }
    end,
  },
  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      {
        's1n7ax/nvim-window-picker',
        lazy = true,
        opts = {
          show_prompt = false,
          filter_rules = {
            autoselect_one = false,
            include_current_win = true,
          },
          highlights = {
            statusline = {
              focused = {
                fg = '#ededed',
                bg = '#ff9e00',
                bold = true,
              },
              unfocused = {
                fg = '#ededed',
                bg = '#ee4592',
                bold = true,
              },
            },
          },
        },
      },
    },
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
      },
      filesystem = {
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = '󰹍', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '󱢒', -- or "", but this is redundant info if you use git_status_colors on the namz
            deleted = '󰹌', -- this can only be used in the git_status source
            renamed = '󰁕', -- this can only be used in the git_status source
            -- Status type
            untracked = '󰹎',
            ignored = '',
            unstaged = '󰌩',
            staged = '',
            conflict = '',
          },
        },
      },
    },
    keys = {
      {
        'º',
        function()
          require('neo-tree.command').execute {
            toggle = true,
            source = 'filesystem',
            position = 'left',
          }
        end,
        desc = 'Explorer NeoTree',
      },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'
      vim.list_extend(opts.sources, {
        nls.builtins.completion.spell,
        nls.builtins.diagnostics.checkmake,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.npm_groovy_lint,
        nls.builtins.diagnostics.terraform_validate,
        nls.builtins.formatting.beautysh,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.goimports_reviser,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.trim_whitespace,
        nls.builtins.formatting.yapf,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'dockerfile',
          'json',
          'json5',
          'jsonc',
          'terraform',
          'hcl',
          'yaml',
        })
      end
    end,
  },
  {
    'telescope.nvim',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension 'fzf'
        end,
      },
      {
        'nvim-telescope/telescope-project.nvim',
        event = 'VeryLazy',
        config = function()
          require('telescope').load_extension 'project'
        end,
      },
      {
        'ThePrimeagen/git-worktree.nvim',
        event = 'VeryLazy',
        config = function()
          require('telescope').load_extension 'git_worktree'
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        event = 'VeryLazy',
        config = function()
          require('telescope').load_extension 'ui-select'
        end,
      },
    },
    opts = {
      picker = {
        hidden = false,
      },
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--no-ignore',
          '--smart-case',
          '--hidden',
        },
        layout_strategy = 'horizontal',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.80,
          height = 0.85,
          preview_cutoff = 120,
        },
      },
    },
  },
}
