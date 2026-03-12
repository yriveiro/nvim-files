-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#404040' })
vim.api.nvim_set_hl(0, 'RenderMarkdownFollowUp', { fg = '#f78c6c', bold = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'neo-tree' },
  callback = function()
    require('ufo').detach()
    vim.opt_local.foldenable = false
  end,
})

-- Set Java-specific indentation to match java-style.xml (4 spaces)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'java', 'xml' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { '*' },
})
