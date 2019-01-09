nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '\'<CR>

let g:which_key_timeout = 1500

" Define prefix dictionary
let g:which_key_map = {}

let g:which_key_map.h = {
  \ 'name' : '+GitGutter' ,
  \ 'p' : ['hp'        , 'preview hunk'],
  \ 's' : ['hs'        , 'stage hunk']  ,
  \ 'u' : ['hu'        , 'undo hunk']   ,
  \ }

augroup WhichKeyPHP
  autocmd!
  autocmd Filetype php let g:which_key_map.f = { 'name' : '+phpCSFix' }
  autocmd Filetype php let g:which_key_map.f.f = 'format-file'
augroup END

call which_key#register('\', "g:which_key_map")

" vim:set ft=vim et sw=2:
