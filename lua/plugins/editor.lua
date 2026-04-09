return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
      { '<LocalLeader>f', '<cmd>Neotree focus<cr>', desc = 'Focus on Neotree' },
    },
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
      window = {
        mappings = {
          ['<Tab>'] = { 'toggle_preview', config = { use_float = true } },
        },
      },
      source_selector = {
        winbar = true,
      },
      filesystem = {
        follow_current_file = { enabled = true },
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
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'dockerfile',
          'hcl',
          'json',
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
    'shahshlok/vim-coach.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    opts = {},
    keys = {
      { '<leader>?', '<cmd>VimCoach<cr>', desc = 'Vim Coach' },
    },
  },
  {
    'chrisgrieser/nvim-recorder',
    opts = {},
  },
}
