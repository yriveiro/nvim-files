local lspconfig = require 'lspconfig'
local npm = require "nvim-lsp-installer.installers.npm"
local server = require 'nvim-lsp-installer.server'

local M = {}
local root_dir = server.get_server_root_path('yaml')

function M.get_opts()
  return {
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    cmd = { npm.executable(root_dir, "yaml-language-server"), "--stdio" },
    filetypes = { 'yaml', 'helm', 'yml' },
    settings = {
      yaml = {
        schemas = {
          ['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json'] = '*.{yaml,yml}',
        },
      },
    },
  }
end

return M
