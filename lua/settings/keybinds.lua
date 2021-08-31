local api = vim.api
local opts = {noremap = true, silent = true}

api.nvim_set_keymap("n", "ty", ":tabnext<CR>", opts)
api.nvim_set_keymap("n", "tr", ":tabprev<CR>", opts)
api.nvim_set_keymap("n", "tn", ":tabnew<CR>", opts)
api.nvim_set_keymap("n", "ch", ":CloseHiddenBuffers<CR>", opts)
api.nvim_set_keymap("n", "<localleader>e", "<cmd>lua require('vim.lsp.diagnostic').show_line_diagnostics()<CR>", opts)
