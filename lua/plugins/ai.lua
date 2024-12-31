return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanion', 'CodeCompanionActions', 'CodeCompanionAdd', 'CodeCompanionChat' },
    opts = {
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            env = {
              url = 'https://ollama.4425017.work',
            },
            headers = {
              ['Content-Type'] = 'application/json',
            },
            parameters = {
              sync = true,
            },

            schema = {
              model = {
                default = 'llama3.2',
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'ollama',
          roles = {
            llm = '  CodeCompanion',
            user = ' us ',
          },
        },
        inline = {
          adapter = 'ollama',
        },
        agent = {
          adapter = 'ollama',
        },
      },
    },

    keys = {
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
      { '<leader>ap', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Prompt Actions (CodeCompanion)' },
      { '<leader>aa', '<cmd>CodeCompanionChat<cr>', mode = { 'n', 'v' }, desc = 'Toggle (CodeCompanion)' },
      { '<leader>ac', '<cmd>CodeCompanionAdd<cr>', mode = 'v', desc = 'Add code to CodeCompanion' },
      { '<leader>ai', '<cmd>CodeCompanion<cr>', mode = 'n', desc = 'Inline prompt (CodeCompanion)' },
    },
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'ollama',
      use_absolute_path = true,
      vendors = {
        ollama = {
          ['local'] = true,
          endpoint = 'https://ollama.4425017.work',
          model = 'llama3.2:latest',
          parse_curl_args = function(opts, code_opts)
            return {
              url = opts.endpoint .. '/v1/chat/completions',
              headers = {
                ['Accept'] = 'application/json',
                ['Content-Type'] = 'application/json',
                ['x-api-key'] = 'ollama',
              },
              body = {
                model = opts.model,
                messages = require('avante.providers').copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
                max_tokens = 4096,
                stream = true,
              },
            }
          end,
          parse_response_data = function(data_stream, event_state, opts)
            require('avante.providers').openai.parse_response(data_stream, event_state, opts)
          end,
        },
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
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
          next = ']x',
          prev = '[x',
        },
        suggestion = {
          accept = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
        jump = {
          next = ']]',
          prev = '[[',
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
      },
      highlights = {
        ---@type AvanteConflictHighlights
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
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
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
}
