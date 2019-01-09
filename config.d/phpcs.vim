" PHPCS

augroup PHPCS
  autocmd!
  autocmd Filetype php let g:php_cs_fixer_path='/usr/local/bin/php-cs-fixer'
  autocmd Filetype php let g:php_cs_fixer_php_path='/usr/bin/php'
  autocmd Filetype php let g:php_cs_fixer_config_file = '/Users/yriveiro/.php_cs'
  autocmd Filetype php let g:php_cs_fixer_cache = '/var/tmp/webcare/php_cs.cache'
  autocmd Filetype php let g:php_cs_fixer_verbose = 1
  autocmd Filetype php nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>
augroup END

" vim:set ft=vim et sw=2:
