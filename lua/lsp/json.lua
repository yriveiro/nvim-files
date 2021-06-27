local lspconfig = require 'lspconfig'

lspconfig.jsonls.setup{
  cmd= {os.getenv("HOME") .. '/.local/share/nvim/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js', '--stdio'},
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
