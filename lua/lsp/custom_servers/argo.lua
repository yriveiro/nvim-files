local npm = require "nvim-lsp-installer.installers.npm"
local server = require 'nvim-lsp-installer.server'

local server_name = 'argo'

-- Argo server is a custom configuration of a yamlls server.
local root_dir = server.get_server_root_path(server_name)

return server.Server:new {
  name = server_name,
  root_dir = root_dir,
  languages = { 'yaml' },
  homepage = "https://github.com/redhat-developer/yaml-language-server",
  installer = npm.packages { "yaml-language-server" },
  default_options = {
    cmd = { npm.executable(root_dir, "yaml-language-server"), "--stdio" },
  },
}
