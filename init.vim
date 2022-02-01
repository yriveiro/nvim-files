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
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'goolord/alpha-nvim'

" Themes
"
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'magicmonty/palebuddy.nvim'

" Git
"
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' " A lightweight and powerful git branch viewer for vim
Plug 'lewis6991/gitsigns.nvim'

" Others
"
Plug 'scrooloose/nerdcommenter'
Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'
Plug 'folke/which-key.nvim'
Plug 'TaDaa/vimade'
Plug 'romainl/vim-qf' " Tame the quickfix window
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Debug
"
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'rcarriga/nvim-dap-ui'
Plug 'yriveiro/dap-go.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'

" Markdown
"
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

"" Golang
"
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Python
"
Plug 'petobens/poet-v'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' , 'for': 'python' }

" CSS
"
Plug 'ap/vim-css-color', {'for': 'css' }

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
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'onsails/lspkind-nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'b0o/SchemaStore.nvim'
Plug 'j-hui/fidget.nvim'

" Developement
Plug 'nvim-lua/neovim-ui'
"Plug 'MunifTanjim/nui.nvim'
Plug 'numtostr/FTerm.nvim'
Plug 'yriveiro/termim.nvim', {'branch': 'develop'}
Plug 'yriveiro/nui.nvim', {'branch': 'feature/attachable-buffer'}
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
