local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not ok then
  return
end



local servers = {
  'bashls',
  'dockerls',
  'gopls',
  'jdtls',
  'jsonls',
  'sumneko_lua',
  'pyright',
  'rust_analyzer',
  'sqls',
  'terraformls',
  'tflint',
  'taplo',
  'yamlls',
}

-- Floating border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or { { ' ', 'FloatBorder' } }
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

lsp_installer.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

for _, server in ipairs(servers) do
  require('lsp.servers.' .. server)
end

-- Load diagnostic settings
require 'lsp.diagnostics'
