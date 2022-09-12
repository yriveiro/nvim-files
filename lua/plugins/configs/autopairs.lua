local ok, autopairs = pcall(require, 'nvim-autopairs')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'nvim-autopairs'
  return
end

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt' },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
}

local ok, cmp = pcall(require, 'cmp')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'cmp'
  return
end

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
