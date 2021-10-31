local api = vim.api
local opts = {noremap = true, silent = true}

api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_commits()<CR>", opts)
