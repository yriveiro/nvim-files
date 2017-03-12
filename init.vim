let $NVIM_HOME="~/.config/nvim"
let $NVIM_PLUGGED= join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG= join([$NVIM_HOME, "config.d"], "/")

"" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

Plug 'ntpeters/vim-better-whitespace'
Plug 'zhaocai/GoldenView.Vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'trevordmiller/nova-vim'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree' | Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'

call plug#end()

"" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
