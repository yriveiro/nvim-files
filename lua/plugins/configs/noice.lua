local ok, noice = pcall(require, 'noice')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'noice'
  return
end

noice.setup {
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
      cmdline = { pattern = '^:', icon = '❯_' },
      search_down = { kind = 'search', pattern = '^/', icon = ' ', ft = 'regex' },
      search_up = { kind = 'search', pattern = '^%?', icon = ' ', ft = 'regex' },
      filter = { pattern = '^:%s*!', icon = '$_', ft = 'sh' },
      lua = { pattern = '^:%s*lua%s+', icon = '_', ft = 'lua' },
      help = { pattern = "^:%s*h%s+", icon = "_" },
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
      filter_options = {},
      win_options = {
        winhighlight = {
          Normal = 'NormalFloat',
        },
      },
    },
    notify = {
      backend = 'notify',
      replace = true,
      format = 'details',
    },
  },
  hacks = {
    -- due to https://github.com/neovim/neovim/issues/20416
    -- messages are resent during a redraw. Noice detects this in most cases, but
    -- some plugins (mostly vim plugns), can still cause loops.
    -- When a loop is detected, Noice exits.
    -- Enable this option to simply skip duplicate messages instead.
    skip_duplicate_messages = true,
  },
  popupmenu = {
    enabled = true, -- disable if you use something like cmp-cmdline
    ---@type 'nui'|'cmp'
    backend = 'nui', -- backend to use to show regular cmdline completions
    -- You can specify options for nui under `config.views.popupmenu`
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        kind = 'search_count',
      },
      opts = { skip = true },
    },
    -- skip which-key messages
    {
      filter = {
        event = 'msg_show',
        kind = 'echo',
        find = 'go up one level',
      },
      opts = { skip = true },
    },
    -- skip window pick message from neotree
    {
      filter = {
        event = 'msg_show',
        find = 'Pick window',
      },
      opts = { skip = true },
    },
  },
  messages = {
    view = 'mini',
  },
  notify = {
    view = 'mini',
  },
  lsp = {
    override = {
      -- override the default lsp markdown formatter with Noice
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      -- override the lsp markdown formatter with Noice
      ["vim.lsp.util.stylize_markdown"] = true,
      -- override cmp documentation with Noice (needs the other options to work)
      ["cmp.entry.get_documentation"] = true,
    },
  }
}
