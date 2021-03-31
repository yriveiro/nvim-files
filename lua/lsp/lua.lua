local lspconfig = require 'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
  require"folding".on_attach(client)
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {'lua-language-server'},
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.1',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.1/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.1/?/init.lua',
          '/usr/share/5.1/?.lua',
          '/usr/share/lua/5.1/?/init.lua'
        }
      },
      workspace = {
        [vim.fn.expand'~/.luarocks/share/lua/5.1'] = true,
        ['/usr/share/lua/5.1'] = true
      }
    }
  }
}
