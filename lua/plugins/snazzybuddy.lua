require('colorbuddy').colorscheme('snazzybuddy')

vim.g.snazzybuddy_icons = true

function SnazzyThemeToggle()
    if vim.g.background == 'dark' then
        vim.g.background = 'light'
    else
        vim.g.background = 'dark'
    end
    require('snazzybuddy').reload()
end
