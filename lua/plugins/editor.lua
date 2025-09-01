return {
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
  -- {
  --   'wakatime/vim-wakatime',
  --   event = 'VeryLazy',
  -- },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      {
        's1n7ax/nvim-window-picker',
        opts = {
          hint = 'statusline-winbar',
          picker_config = {
            statusline_winbar_picker = {
              use_winbar = 'always',
            },
          },
          show_prompt = false,
          filter_rules = {
            autoselect_one = false,
            include_current_win = false,
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
      hidden = true,
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
            position = 'left',
            source = 'filesystem',
            toggle = true,
            focused = true,
          }
        end,
        desc = 'Explorer NeoTree',
      },
      {
        '\\º',
        function()
          require('neo-tree.command').execute {
            position = 'left',
            reveal = true,
            source = 'filesystem',
            toggle = true,
            focused = true,
          }
        end,
        desc = 'Explorer NeoTree',
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'dockerfile',
          'hcl',
          'json',
          'json5',
          'jsonc',
          'markdown_inline',
          'sql',
          'terraform',
          'yaml',
        })
      end
    end,
  },
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>cd',
        '<cmd>Neogen<cr>',
        desc = 'Create doc string for selected text or word under the cursor',
      },
    },
    opts = {
      languages = {
        python = {
          template = {
            annotation_convention = 'numpydoc',
          },
        },
      },
    },
    -- Uncomment next line if you want to follow only stable versions
    version = '*',
  },
  {
    'towolf/vim-helm',
    event = 'VeryLazy',
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'classic',
    },
  },
  {
    'shahshlok/vim-coach.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    config = function()
      require('vim-coach').setup()
    end,
    keys = {
      { '<leader>?', '<cmd>VimCoach<cr>', desc = 'Vim Coach' },
    },
  },
  {
    'alex-popov-tech/store.nvim',
    dependencies = {
      'OXY2DEV/markview.nvim', -- optional, for pretty readme preview / help window
    },
    cmd = 'Store',
    keys = {
      { '<LocalLeader>1', '<cmd>Store<cr>', desc = 'Open Plugin Store' },
    },
    opts = {
      -- optional configuration here
    },
  },
}
