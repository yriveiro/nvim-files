local ok, wp = pcall(require, 'window-picker')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'window-picker'
  return
end

wp.setup()

PickWindow = function()
  local picked_window_id = wp.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end
