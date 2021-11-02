" Yago Riveiro's vim configuration

"  Overarching Philosophy:
" 1. Prefer the defaults
" 2. Extend functionality where needed
" 3. Change functionality only when it doesn't make sense

let $NVIM_HOME = join([$HOME, ".config/nvim"], "/")
let $NVIM_CACHE = join([$HOME, ".cache/nvim"], "/")
let $NVIM_PLUGGED = join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG = join([$NVIM_HOME, "config.d"], "/")

" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

" Sanitizers Linters Formaters and Code Style
"
Plug 'McAuleyPenney/tidy.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'windwp/nvim-autopairs'
Plug 'embear/vim-localvimrc'

" Navigation
"
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-tree.lua'

" UI
"
Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git
"
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' " A lightweight and powerful git branch viewer for vim
Plug 'lewis6991/gitsigns.nvim'

" Search
"
"Plug 'jremmen/vim-ripgrep'

" Others
"
Plug 'scrooloose/nerdcommenter'
Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'
Plug 'folke/which-key.nvim'
Plug 'TaDaa/vimade'
Plug 'romainl/vim-qf' " Tame the quickfix window
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'mfussenegger/nvim-dap'

" Markdown
"
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

"" Golang
"
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve', { 'for': 'go' }
Plug 'leoluz/nvim-dap-go', { 'for': 'go' }

" Python
"
Plug 'petobens/poet-v'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' , 'for': 'python' }

" CSS
"
"Plug 'ap/vim-css-color', {'for': 'css' }

" TOML
"
Plug 'cespare/vim-toml'

" Terraform
"
Plug 'hashivim/vim-terraform'

" Helm
"
Plug 'towolf/vim-helm'

" LSP server
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind-nvim'
Plug 'rafamadriz/friendly-snippets'

" Developement
Plug 'nvim-lua/neovim-ui'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'


call plug#end()

"lua require('impatient')
lua require('')

" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
