local g = vim.g
local api = vim.api
local opts = {noremap = true, silent = true}

g.Lf_WindowPosition='popup'
g.Lf_PreviewInPopup=1
g.Lf_AutoResize=1
g.Lf_WorkingDirectoryMode='Ac'


api.nvim_set_keymap("n", "R", ":Leaderf rg<CR>", opts)
