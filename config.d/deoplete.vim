let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length= 2

let deoplete#tag#cache_limit_size = 5000000

let g:deoplete#sources = get(g:, 'deoplete#sources', {})
let g:deoplete#sources._    = ['neosnippet', 'buffer', 'file', 'tag']
let g:deoplete#sources.php  = ['neosnippet', 'padawan', 'buffer', 'file', 'tag']

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})

autocmd CompleteDone * silent! pclose!

function g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction

function g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction


call deoplete#custom#source('padawan', 'mark', '⌁')
call deoplete#custom#source('neosnippet', 'mark', '⌘')
call deoplete#custom#source('buffer', 'mark', '∂')
call deoplete#custom#source('tag', 'mark', 'Ω')

call deoplete#custom#source('neosnippet', 'rank', 500)
call deoplete#custom#source('buffer', 'rank', 400)
call deoplete#custom#source('padawan', 'rank', 300)
call deoplete#custom#source('tag', 'rank', 200)

" vim:set ft=vim et sw=2:
