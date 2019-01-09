"" Configurations
"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline_theme = 'nova'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '«'
let g:airline_readonly_symbol = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#undotree#enabled = 1
let g:airline#extensions#quickfix#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#readonly#symbol = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol = 'ρ'

" vim:set ft=vim et sw=2:
