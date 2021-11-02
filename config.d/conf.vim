"" Configurations
"

set dir=/tmp/neovim
set wildmode=list:longest,list:full
set completeopt+=menuone,noinsert,noselect,preview
set listchars=eol:¬
set viewoptions=cursor,folds,slash,unix

hi NonText ctermfg=7 guifg=gray

if (exists('+colorcolumn'))
  set colorcolumn=80,120
  highlight ColorColumn ctermbg=7 guibg=red
endif

" vim:set ft=vim et sw=2:
