let $NVIM_HOME="~/.config/nvim"
let $NVIM_PLUGGED= join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG= join([$NVIM_HOME, "config.d"], "/")

"" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

"" Sanitizers Linters Formaters and Code Style
"
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'Krasjet/auto.pairs'
Plug 'embear/vim-localvimrc'


"" Navigation
"
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'kristijanhusak/defx-icons' | Plug 'kristijanhusak/defx-git'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

"" Async
"
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" UI
"
Plug 'mhinz/vim-startify'
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ryanoasis/vim-devicons'

"" Git
"
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' " A lightweight and powerful git branch viewer for vim
Plug 'airblade/vim-gitgutter'

"" Snippets
"
Plug 'shougo/neosnippet.vim' | Plug 'shougo/neosnippet-snippets'


"" Search
"
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

"" Folding
"
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'

"" Deoplete Autocomplete plugins
"
Plug 'zchee/deoplete-clang', {'for': 'cpph'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

"" Debug
"

Plug 'joonty/vdebug'

Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdcommenter'
"Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'TaDaa/vimade'
Plug 'romainl/vim-qf' " Tame the quickfix window
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

"" Markdown
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }

"" Python
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

"" JavaScript
Plug 'ruanyl/vim-fixmyjs', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', {'for': 'javascript' }
Plug 'leafgarland/typescript-vim', {'for': 'typescript' }

" CSS
Plug 'ap/vim-css-color', {'for': 'css' }

"" TOML
Plug 'cespare/vim-toml'

call plug#end()

"" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
