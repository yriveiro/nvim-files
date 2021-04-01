local utils = require('utils')

require"compe".setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        buffer = true;
        nvim_lsp = true;
        nvim_lua = true;
        path = {priority = 1};
        vsnip = {priority = 9999};
    };
}

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return utils.replace_termcodes("<Plug>(vsnip-expand-or-jump)")
    end
    return utils.replace_termcodes("<Tab>")
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

OnEnter = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    end
    return require("nvim-autopairs").check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.OnEnter()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-y>", [[compe#confirm("<C-y>")]], {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close("<C-e>")]], {expr = true, silent = true})
