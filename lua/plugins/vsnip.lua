local utils = require('utils')

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return utils.replace_termcodes("<C-n><C-y>")
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return utils.replace_termcodes("<Plug>(vsnip-expand-or-jump)")
    else
        return utils.replace_termcodes("<Tab>")
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

vim.api.nvim_set_keymap("n", "<Leader>v", ":VsnipOpenSplit<CR>", {silent = true})
