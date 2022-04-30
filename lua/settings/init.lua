require 'settings/autocmds'

local api = vim.api
local o = vim.o
local g = vim.g

api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Leader key configuation
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
g.mapleader = "\\"        -- define leader key
g.localmapleader = ","    -- define local leader

o.clipboard = "unnamedplus"                     -- allows neovim to access the system clipboard
o.cursorline  = true                            -- Highlight the screen line of the cursor.
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 2
o.foldmethod = "expr"
o.laststatus = 2                                -- Display the status line always
o.linespace = 0                                 -- Set line-spacing to minimum.
o.mouse = "a"                                   -- enable mouse
o.number = true                                 -- Line numbers
o.relativenumber = true                         -- Line relative numbers
o.showcmd = true                                -- Show (partial) command in status line.
o.showmode = true                               -- Show current mode.
o.splitbelow = true
o.splitright = true                             -- Split configurations
o.synmaxcol = 2048                              -- Set a limit for syntax highlights
o.termguicolors = true                          -- Enable true colors
o.secure = true                                 -- Prevent run autocmd not owned by you.
o.fileencoding = "utf-8"                        -- the encoding written to a file
o.undodir = os.getenv("NVIM_CACHE") .. "/undo"  -- set an undo directory
o.undofile = true
o.wildmenu = true
o.autoread = true
o.exrc = true
o.guifont = "MesloLGM Nerd Font Mono"

vim.cmd[[colorscheme nord]]
