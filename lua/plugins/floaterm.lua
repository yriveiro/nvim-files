local cmd = vim.cmd
local g = vim.g

g.floaterm_autoclose=1
g.floaterm_width=0.85
g.floaterm_height=0.85

g.floaterm_autoinsert=1
g.floaterm_keymap_hide='<leader>t'
g.floaterm_keymap_toggle='<leader>t'
g.floaterm_keymap_kill='<leader>tk'
g.floaterm_keymap_new='<leader>tn'
g.floaterm_keymap_next='<leader>ty'
g.floaterm_keymap_prev='<leader>tr'
g.floaterm_title='TERM [$1/$2]'

cmd "au User Startified setlocal buflisted"
