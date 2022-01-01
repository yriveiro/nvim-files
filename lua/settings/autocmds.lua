local cmd = vim.cmd

cmd "au FocusGained,BufEnter * :checktime"
cmd "au BufEnter * :syntax sync fromstart"
cmd "au CompleteDone * pclose"
cmd "au BufEnter term://* setlocal nonumber"
cmd "au FileType dap-repl lua require('dap.ext.autocompl').attach()"
cmd "au BufWritePre *.tf lua vim.lsp.buf.formatting_sync()"
