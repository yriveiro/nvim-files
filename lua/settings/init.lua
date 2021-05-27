require 'settings/keybinds'
require 'settings/autocmds'

local api = vim.api

api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

vim.o.mouse = "a" -- enable mouse
vim.o.showcmd = true -- Show (partial) command in status line.
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
