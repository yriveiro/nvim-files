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
    'telescope.nvim',
    dependencies = {
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
        keys = {
          { -- lazy style key map
            '<leader>cw',
            '<cmd>Telescope git_worktree<cr>',
            desc = 'Git worktree',
          },
        },
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
      {
        'debugloop/telescope-undo.nvim',
        event = 'VeryLazy',
        keys = {
          { -- lazy style key map
            '<leader>cu',
            '<cmd>Telescope undo<cr>',
            desc = 'undo history',
          },
        },
        config = function()
          require('telescope').load_extension 'undo'
        end,
      },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
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
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>cc',
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
    'folke/flash.nvim',
    opts = {
      search = {
        modes = {
          search = {
            enabled = false,
          },
        },
      },
    },
  },
}
