--local configs = require 'lspconfig.configs'

--[[
   [-- Check if the config is already defined (useful when reloading this file)
   [if not configs.argo then
   [  configs.argo = {
   [    default_config = {
   [      filetypes = {'yaml.argo'},
   [      root_dir = function(fname)
   [        return require'lspconfig.util'.find_git_ancestor(fname)
   [      end,
   [    }
   [  }
   [end
   [
   [require'lspconfig'.argo.setup{}
   [
   [-- Load Custom Servers.
   [local servers = require 'nvim-lsp-installer.servers'
   [local argo = require 'lsp/custom_servers/argo'
   [-- Register Custom Server on nvim-lsp-installer.
   [servers.register(argo)
   ]]

-- Require configuration
--
require 'lsp.java'
--require 'lsp.argo'
require 'lsp.bash'
require 'lsp.docker'
require 'lsp.go'
require 'lsp.json'
require 'lsp.lua'
require 'lsp.markdown'
require 'lsp.pyright'
require 'lsp.rust'
require 'lsp.sql'
require 'lsp.tf'
require 'lsp.tflint'
require 'lsp.toml'
require 'lsp.yaml'
