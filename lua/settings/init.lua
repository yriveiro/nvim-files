require 'settings/autocmds'

local api = vim.api
local o = vim.o
local g = vim.g

api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Leader key configuation
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
g.mapleader = "\\"        -- define leader key
g.localmapleader = ","    -- define local leader

o.mouse = "a"             -- enable mouse
o.showcmd = true          -- Show (partial) command in status line.
o.number = true           -- Line numbers
o.relativenumber = true   -- Line relative numbers
o.termguicolors = true    -- Enable true colors
o.synmaxcol = 2048        -- Set a limit for syntax highlights
o.laststatus = 2          -- Display the status line always
o.linespace = 0           -- Set line-spacing to minimum.
o.showmode = true         -- Show current mode.
o.cursorline  = true      -- Highlight the screen line of the cursor.
o.splitbelow = true
o.splitright = true       -- Split configurations
o.foldlevelstart = 1
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
