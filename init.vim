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
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/nerdtree' | Plug 'xuyuanp/nerdtree-git-plugin'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'shougo/neosnippet.vim' | Plug 'shougo/neosnippet-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'zchee/deoplete-clang', {'for': 'cpph'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'joonty/vdebug', { 'for': 'php' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

call plug#end()

"" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
