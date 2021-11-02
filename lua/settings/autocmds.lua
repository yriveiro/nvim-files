local cmd = vim.cmd

cmd "au FocusGained,BufEnter * :checktime"
cmd "au BufEnter * :syntax sync fromstart"
cmd "au CompleteDone * pclose"
cmd "au BufEnter term://* setlocal nonumber"
