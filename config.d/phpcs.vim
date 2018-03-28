" PHPCS

let g:php_cs_fixer_path='/usr/local/bin/php-cs-fixer'
let g:php_cs_fixer_php_path='/usr/local/bin/php'
let g:php_cs_fixer_config_file = '/Users/yriveiro/.php_cs'
let g:php_cs_fixer_verbose = 1

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

" vim:set ft=vim et sw=2:
