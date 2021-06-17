"" Configurations
"

set dir=/tmp/neovim
set wildmode=list:longest,list:full
set wildmenu
set shortmess+=c
set completeopt+=menuone,noinsert,noselect,preview
set autoread
set exrc                          " load per project configuration if exists.
set listchars=eol:¬
set viewoptions=cursor,folds,slash,unix
set secure                        " prevent run autocmd not owned by you.
set clipboard=unnamedplus

" Better color support
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

hi NonText ctermfg=7 guifg=gray

" Themes
"
colorscheme snazzy

if (exists('+colorcolumn'))
  set colorcolumn=80,120
  highlight ColorColumn ctermbg=7 guibg=red
endif

" vim:set ft=vim et sw=2:
