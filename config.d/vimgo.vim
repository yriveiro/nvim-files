" Golang custom settings
"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

autocmd FileType go nmap <leader>et  <Plug>(go-test)
autocmd FileType go nmap <leader>eb  <Plug>(go-build)
autocmd FileType go nmap <leader>er  <Plug>(go-run)
autocmd FileType go nmap <Leader>ec <Plug>(go-coverage-toggle)

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" vim:set ft=vim et sw=2:
