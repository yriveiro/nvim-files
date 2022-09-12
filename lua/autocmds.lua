-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
})

-- Disable comment new line
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

vim.api.nvim_create_autocmd('FocusGained,BufEnter', {
  pattern = '*',
  callback = function()
    vim.cmd [[checktime]]
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.cmd [[syntax sync fromstart]]
  end,
})

vim.api.nvim_create_autocmd('CompleteDone', {
  pattern = '*',
  callback = function()
    vim.cmd [[pclose]]
  end,
})

vim.api.nvim_create_autocmd('CompleteDone', {
  pattern = 'term://*',
  callback = function()
    vim.cmd [[setlocal nonumber]]
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dap-repl',
  callback = function()
    require('dap.ext.autocompl').attach()
  end,
})

vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*.tf',
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.tf',
  callback = function()
    vim.cmd [[set filetype=terraform]]
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.py',
  callback = function()
    vim.cmd [[setlocal colorcolumn=120]]
  end,
})
