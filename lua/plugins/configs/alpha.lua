local ok, alpha = pcall(require, 'alpha')

if not ok then
  return
end

local dsh = require 'alpha.themes.dashboard'

local function button(sc, txt, keybind, keybind_opts)
    local b = dsh.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = 'DashboardShortCut'
    b.opts.hl_shortcut = 'DashboardHeader'
    return b
end

dsh.section.header.val = {
    [[ < Join Neovim, we have buffers! > ]],
    [[ --------------------------------- ]],
    [[        \    ,-^-.                 ]],
    [[         \   !oYo!                 ]],
    [[          \ /./=\.\______          ]],
    [[               ##        )\/\      ]],
    [[                ||-----w||         ]],
    [[                ||      ||         ]],
    [[                                   ]],
    [[             Cowth Vader           ]],
}

dsh.section.buttons.val = {
    button('\\ f f', '  Find File', '<cmd>Telescope find_files<cr>'),
    button('\\ f o', '  Recents', '<cmd>Telescope oldfiles<cr>'),
    button('\\ f r', '  Find Word', '<cmd>Telescope live_grep<cr>'),
    button('\\ f m', '  Bookmarks', '<cmd>Telescope marks<cr>'),
}

dsh.section.footer.val = ''
dsh.section.footer.opts.hl = 'DashboardFooter'

alpha.setup(dsh.opts)
