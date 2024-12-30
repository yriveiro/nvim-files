-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Wrapper for vim.keymap.set function
local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<leader>k', '<cmd>WhichKey<cr>', { desc = 'Whichkey' })

map('n', '\\e', function()
  require('vim.diagnostic').open_float()
end, { desc = 'Show Diagnostics' })

map('n', '\\w', function()
  local wp = require 'window-picker'
  local picked_window_id = wp.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = 'Pick window' })

map('n', '\\f', '<cmd>Neotree focus<cr>', { desc = 'Focus on Neotree' })
map('n', '<tab>l', '<cmd>tabnex<cr>', { desc = 'Next tab' })
map('n', '<tab>h', '<cmd>tabprev<cr>', { desc = 'Previous tab' })
map('n', '\\st', '<cmd>OpenDoc<cr>', { desc = 'Open Terraform Doc' })
