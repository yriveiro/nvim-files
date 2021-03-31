require 'settings/keybinds'
require 'settings/autocmds'

local api = vim.api

api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
