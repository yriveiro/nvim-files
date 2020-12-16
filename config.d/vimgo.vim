"let g:go_addtags_transform = "snakecase"
"let g:go_fmt_command = "goimports"
"let g:go_gopls_staticcheck = 1
"let g:go_highlight_types = 1
"let g:go_list_autoclose = 1
"let g:go_list_height = 5
"let g:go_list_type = "quickfix"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_command = 'gopls'
"let g:go_metalinter_deadline = "5s"
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_snippet_engine = "automatic"

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
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" vim:set ft=vim et sw=2:
