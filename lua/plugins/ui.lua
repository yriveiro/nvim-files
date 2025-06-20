return {
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>m',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
      {
        mode = { 'n' },
        '<Leader>mp',
        '<cmd>MCpattern<cr>',
        desc = 'Prompts for a pattern and selects every match in the buffer',
      },
      {
        mode = { 'n', 'v' },
        '<Leader>mc',
        '<cmd>MCclear<cr>',
        desc = 'Clears all the selections',
      },
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = {
      'kevinhwang91/promise-async',
      lazy = true,
    },
    config = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      require('ufo').setup {
        enable_get_fold_virt_text = true,
        preview = {},
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = { default = { 'imports', 'comment' } },
        fold_virt_text_handler = handler,
        filetype_exclude = {
          'trouble',
          'aerial',
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'spectre_panel',
        },
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
  {
    'm4xshen/smartcolumn.nvim',
    opts = {
      disabled_filetypes = {
        'alpha',
        'help',
        'lazy',
        'trouble',
        'markdown',
        'mason',
        'neo-tree',
        'noice',
        'text',
        'spectre_panel',
        'Avante',
      },
      custom_colorcolumn = {
        python = { '120', '200' },
      },
    },
  },
  -- Custom configurations for LazyVim ones
  {
    'goolord/alpha-nvim',
    optional = true,
    opts = function(_, dashboard)
      dashboard.section.header.val = {
        [[ < Join Neovim, we have buffers! > ]],
        [[ --------------------------------- ]],
        [[        \    ,-^-.                 ]],
        [[         \   !oYo!                 ]],
        [[          \ /./=\.\______          ]],
        [[               ##        )\/\      ]],
        [[                ||-----w||         ]],
        [[                ||      ||         ]],
        [[                                   ]],
        [[             Cowth Vader           ]],
      }
      local button = dashboard.button('m', '󰏓 ' .. ' Mason', ':Mason<CR>')
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
      table.insert(dashboard.section.buttons.val, 9, button)
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
      button = dashboard.button('op', ' ' .. ' [Obsidian] Personal', ':ObsidianWorkspace personal<CR>')
      table.insert(dashboard.section.buttons.val, 10, button)
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
      button = dashboard.button('ow', ' ' .. ' [Obsidian] Work', ':ObsidianWorkspace work<CR>')
      table.insert(dashboard.section.buttons.val, 11, button)
    end,
  },
  {
    'folke/noice.nvim',
    opts = {
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = { buf_options = { filetype = 'vim' } }, -- enable syntax highlighting in the cmdline
        ---@type table<string, CmdlineFormat>
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          cmdline = {
            pattern = '^:',
            icon = '❯_',
            lang = 'vim',
          },
          search_down = {
            kind = 'search',
            pattern = '^/',
            icon = ' ',
            ft = 'regex',
          },
          search_up = {
            kind = 'search',
            pattern = '^%?',
            icon = ' ',
            lang = 'regex',
          },
          filter = {
            pattern = '^:%s*!',
            icon = '$_',
            lang = 'sh',
          },
          lua = {
            pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' },
            icon = '_',
            lang = 'lua',
          },
          help = {
            pattern = '^:%s*h%s+',
            icon = '󱜹_',
          },
          -- lua = false, -- to disable a format, set to `false`
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = 'none',
            padding = { 1, 1 },
          },
          size = {
            min_width = 80,
            width = 'auto',
            height = 'auto',
          },
          win_options = {
            winhighlight = {
              Normal = 'NormalFloat',
            },
          },
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  {
    'folke/todo-comments.nvim',
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = '⚡', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = 'ℹ ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '󰅒 ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        DEPR = { icon = ' ', color = 'error', alt = { 'DEPRECATION' } },
      },
      highlight = {
        before = '', -- 'fg' or 'bg' or empty
        -- keyword = 'wide', -- 'fg', 'bg', 'wide' or empty. (wide is the same as bg, but will also highlight surrounding characters)
        keyword = 'wide', -- 'fg', 'bg', 'wide' or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = '', -- 'fg' or 'bg' or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
    },
  },
  {
    'stevearc/stickybuf.nvim',
    opts = {},
  },
  {
    'onsails/lspkind.nvim',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    'echasnovski/mini.indentscope',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'lazy',
          'alpha',
        },
        callback = function()
          vim.b.miniindentscope_disable = true ---@diagnostic disable-line
        end,
      })
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    lazy = 'VeryLazy',
  },
}
