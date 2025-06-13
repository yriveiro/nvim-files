return {
  {
    'GeorgesAlkhouri/nvim-aider',
    cmd = {
      'AiderTerminalToggle',
      'AiderHealth',
    },
    keys = {
      { '<leader>a/', '<cmd>AiderTerminalToggle<cr>', desc = 'Open Aider' },
      { '<leader>as', '<cmd>AiderTerminalSend<cr>', desc = 'Send to Aider', mode = { 'n', 'v' } },
      { '<leader>ac', '<cmd>AiderQuickSendCommand<cr>', desc = 'Send Command To Aider' },
      { '<leader>ab', '<cmd>AiderQuickSendBuffer<cr>', desc = 'Send Buffer To Aider' },
      { '<leader>a+', '<cmd>AiderQuickAddFile<cr>', desc = 'Add File to Aider' },
      { '<leader>a-', '<cmd>AiderQuickDropFile<cr>', desc = 'Drop File from Aider' },
      { '<leader>ar', '<cmd>AiderQuickReadOnlyFile<cr>', desc = 'Add File as Read-Only' },
      { '<leader>a+', '<cmd>AiderTreeAddFile<cr>', desc = 'Add File from Tree to Aider', ft = 'NvimTree' },
      { '<leader>a-', '<cmd>AiderTreeDropFile<cr>', desc = 'Drop File from Tree from Aider', ft = 'NvimTree' },
    },
    dependencies = {
      'folke/snacks.nvim',
      --- The below dependencies are optional
      'catppuccin/nvim',
      'nvim-tree/nvim-tree.lua',
    },
    config = true,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    opts = {
      provider = 'ollama',
      providers = {
        ollama = {
          endpoint = 'http://ollama.4425017.work',
          model = 'qwen3:8b',
          temperature = 0,
        },
      },
      auto_suggestions_provider = 'ollama',
      debug = false,
      use_absolute_path = true,
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        enable_cursor_planning_mode = true,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
      },
      mappings = {
        diff = {
          ours = 'co',
          theirs = 'ct',
          all_theirs = 'ca',
          both = 'cb',
          cursor = 'cc',
          next = '\\>x',
          prev = '\\<x',
        },
        suggestion = {
          accept = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
        jump = {
          next = '\\>',
          prev = '\\<',
        },
        submit = {
          normal = '<CR>',
          insert = '<C-s>',
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = 'right', -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          align = 'center', -- left, center, right for title
          rounded = true,
        },
        file_selector = {
          --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
          provider = 'fzf',
          -- Options override for custom providers
          provider_opts = {},
        },
      },
      highlights = {
        diff = {
          current = 'DiffText',
          incoming = 'DiffAdd',
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = 'copen',
      },
      web_search_engine = {
        provider = 'kagi',
        proxy = nil,
        providers = {},
      },
    },
    build = 'make',
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua',
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  -- {
  --   'sourcegraph/sg.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     require('sg').setup { accept_tos = true }
  --   end,
  -- },
}
