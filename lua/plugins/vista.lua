local api = vim.api
local opts = {noremap = true, silent = true}

api.nvim_set_keymap("n", "<leader>b", ":Vista!!<CR>", opts)
