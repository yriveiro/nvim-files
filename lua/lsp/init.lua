require 'lsp.bash'
require 'lsp.docker'
require 'lsp.go'
require 'lsp.json'
require 'lsp.lua'
require 'lsp.python'
require 'lsp.tf'
require 'lsp.yaml'
require 'lsp.argo'
require 'lsp.dockercompose'

local api = vim.api
local opts = {noremap = true, silent = true}

-- LSP Mappings
api.nvim_set_keymap('n', ',0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
api.nvim_set_keymap('n', ',d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
api.nvim_set_keymap('n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
api.nvim_set_keymap('n', ',h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
api.nvim_set_keymap('n', ',i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
api.nvim_set_keymap('n', ',r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
api.nvim_set_keymap('n', ',td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
api.nvim_set_keymap('n', ',w', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
api.nvim_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
