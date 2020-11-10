let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length= 2
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'

let deoplete#tag#cache_limit_size = 5000000

call deoplete#custom#option('sources', get(g:, 'deoplete#sources', {}))

call deoplete#custom#option('sources', {
\ '_': ['neosnippet', 'buffer', 'file', 'tag'],
\ 'php': ['omni', 'phpactor', 'neosnippet', 'buffer', 'file', 'tag'],
\ 'rust': ['neosnippet', 'rust', 'buffer', 'file', 'tag'],
\ 'go': ['go', 'buffer', 'file', 'tag'],
\ 'python': ['jedi', 'neosnippet', 'buffer', 'file', 'tag'],
\ 'terraform': ['omni', 'buffer', 'file', 'tag'],
\})

call deoplete#custom#option('sources', {
\ 'go': {'mark': '⌁', 'rank': 300},
\ 'phpfactor': {'mark': '⌁'},
\ 'php': {'rank': 300},
\ 'jedi': {'mark': '⌁', 'rank': 300},
\ 'neosnippet': {'mark': '⌘', 'rank': 500},
\ 'buffer': {'mark': '∂', 'rank': 400},
\ 'tag': {'mark': 'Ω', 'rank': 200},
\ 'omni': {'mark': '‰', 'rank': 200},
\})

call deoplete#custom#option('ignore_sources', get(g:, 'deoplete#ignore_sources', {}))

autocmd CompleteDone * silent! pclose!

" vim:set ft=vim et sw=2:
