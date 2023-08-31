-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd [[highlight ColorColumn guibg=#FF8C00]]

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'neo-tree', 'Outline' },
  callback = function()
    require('ufo').detach()
    vim.opt_local.foldenable = false
  end,
})
