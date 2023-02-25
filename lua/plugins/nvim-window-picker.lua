return {
  's1n7ax/nvim-window-picker',
  lazy = true,
  config = function()
    require('window-picker').setup()

    PickWindow = function()
      local picked_window_id = wp.pick_window() or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end
  end,
}
