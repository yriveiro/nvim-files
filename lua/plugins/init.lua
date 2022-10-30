local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, 'packer')

if not ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
  git = {
    clone_timeout = 600,
  },
  auto_clean = true,
  compile_on_sync = false,
}

return packer.startup(function(use)
  -- System
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'nathom/filetype.nvim' }

  -- UI
  use { 'rmehri01/onenord.nvim' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'rcarriga/nvim-notify', config = require 'plugins.configs.notify' }
  use { 'kyazdani42/nvim-web-devicons', config = require 'plugins.configs.icons' }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require 'plugins.configs.alpha',
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require 'plugins.configs.lualine',
  }
  use {
    'arkav/lualine-lsp-progress',
    requires = { 'nvim-lualine/lualine.nvim' }
  }
  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = require 'plugins.configs.diffview',
  }
  use { 'yriveiro/termim.nvim' }
  use { 'norcalli/nvim-colorizer.lua', config = require 'plugins.configs.colorizer' }
  use { 'ellisonleao/glow.nvim', branch = 'main' }

  -- Search and Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.telescope',
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use {
    'nvim-telescope/telescope-cheat.nvim',
    requires = 'kkharji/sqlite.lua',
  }
  use { 'folke/which-key.nvim' }
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'hrsh7th/nvim-cmp',
    },
    config = require 'plugins.configs.noice',
  }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = require 'plugins.configs.neotree',
  }
  use { 'mg979/vim-visual-multi' }
  use { 'liuchengxu/vista.vim' }
  use {
    'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.todo',
  }
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = require 'plugins.configs.ufo',
  }

  use { 's1n7ax/nvim-window-picker', config = require 'plugins.configs.windowpicker' }

  -- Utilities
  use { 'McAuleyPenney/tidy.nvim' } -- trailing whitespaces and delete empty lines at EOF
  use { 'amirali/yapf.nvim', config = require 'plugins.configs.yapf' }
  use { 'danymat/neogen', config = require 'plugins.configs.neogen', requires = 'nvim-treesitter/nvim-treesitter' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'mbbill/undotree' }
  use { 'sychen52/smart-term-esc.nvim' }
  use { 'terrortylor/nvim-comment', config = require 'plugins.configs.nvimcomment' }
  use { 'wakatime/vim-wakatime' }
  use { 'windwp/nvim-autopairs', config = require 'plugins.configs.autopairs' }

  -- Debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'yriveiro/dap-go.nvim',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = require 'plugins.configs.dap',
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap',
    },
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require 'plugins.configs.treesitter',
  }

  use {
    'nvim-treesitter/playground',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.gitsigns',
  }
  use { 'rbong/vim-flog' }
  use { 'tpope/vim-fugitive' }
  use {
    'ThePrimeagen/git-worktree.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
  }

  -- LSP
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = require 'plugins.configs.mason',
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = require 'plugins.configs.lsp_lines'
  }

  use { 'b0o/SchemaStore.nvim' }

  -- Completion
  use {
    'L3MON4D3/LuaSnip',
    requires = 'rafamadriz/friendly-snippets',
    config = require 'plugins.configs.luasnip',
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      -- 'dmitmel/cmp-cmdline-history',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
    },
    config = require 'plugins.configs.cmp',
  }

  -- Plugin Development

  use {
    '~/Development/github/cheat-sh.nvim/main',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
