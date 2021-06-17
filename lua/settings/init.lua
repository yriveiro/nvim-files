require 'settings/keybinds'
require 'settings/autocmds'

local api = vim.api

api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

vim.o.mouse = "a"             -- enable mouse
vim.o.showcmd = true          -- Show (partial) command in status line.
vim.o.number = true           -- Line numbers
vim.o.relativenumber = true   -- Line relative numbers
vim.o.termguicolors = true    -- Enable true colors
vim.o.synmaxcol = 2048        -- Set a limit for syntax highlights
vim.o.laststatus = 2          -- Display the status line always
vim.o.linespace = 0           -- Set line-spacing to minimum.
vim.o.showmode = true         -- Show current mode.
vim.o.cursorline  = true      -- Highlight the screen line of the cursor.
vim.o.splitbelow = true
vim.o.splitright = true       -- Split configurations
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
