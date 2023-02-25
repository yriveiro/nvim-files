return {
  's1n7ax/nvim-window-picker',
  lazy = true,
  config = function()
    local wp = require 'window-picker'

    wp.setup {
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', 'quickfix' },
        },
      },
      other_win_hl_color = '#e35e4f',
    }

    PickWindow = function()
      local picked_window_id = wp.pick_window() or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end
  end,
}
