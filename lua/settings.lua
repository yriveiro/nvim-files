local theme = require "theme"

local o = vim.opt
local g = vim.g
local fn = vim.fn

-- Leader key configuation
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
g.mapleader = "\\" -- Define leader key.
g.localmapleader = "," -- Define local leader.

vim.cmd [[set fcs=eob:\ ]]
vim.cmd [[filetype plugin indent on]]

local options = {
    autoread = true,
    background = "dark",
    backup = false,
    clipboard = "unnamedplus", -- Allows neovim to access the system clipboard.
    cmdheight = 1,
    cursorline = true, -- Highlight the screen line of the cursor.
    expandtab = true,
    exrc = true,
    fileencoding = "utf-8", -- The encoding written to a file.
    foldexpr = "nvim_treesitter#foldexpr()",
    foldlevelstart = 2,
    foldmethod = "expr",
    guifont = "MesloLGM Nerd Font Mono",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 3, -- Display the status line always.
    linespace = 0, -- Set line-spacing to minimum.
    mouse = "a", -- Enable mouse.
    number = true, -- Line numbers.
    pumheight = 10,
    relativenumber = true, -- Line relative numbers.
    scrolloff = 5,
    secure = true, -- Prevent run autocmd not owned by you.
    shiftround = true,
    shiftwidth = 2,
    showcmd = true, -- Show (partial) command in status line.
    showmode = true, -- Show current mode.
    sidescrolloff = 5,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true, -- Split configurations.
    swapfile = false,
    synmaxcol = 2048, -- Set a limit for syntax highlights
    tabstop = 2,
    termguicolors = true, -- Enable true colors
    timeoutlen = 1000,
    undodir = vim.fn.stdpath('cache') .. "/undo", -- set an undo directory.
    undofile = true,
    updatetime = 250,
    wildmenu = true,
}

o.shortmess:append "c"

for key, value in pairs(options) do
    o[key] = value
end

theme.init()
