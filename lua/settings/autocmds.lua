local cmd = vim.cmd

cmd "au BufWritePre * StripWhitespace"
cmd "au FocusGained,BufEnter * :checktime"
cmd "au BufEnter * :syntax sync fromstart"
cmd "au CompleteDone * pclose"

-- Defx redraw on Buffer save
--cmd "au BufWritePost * call defx#redraw()"
-- Draw Diagnostics List
--cmd "au BufWritePost * lua vim.lsp.diagnostic.set_loclist()"