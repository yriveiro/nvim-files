local ok, noice = pcall(require, 'noice')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'noice'
  return
end

noice.setup {
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
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
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
    backend = 'cmp', -- backend to use to show regular cmdline completions
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
  },
}
