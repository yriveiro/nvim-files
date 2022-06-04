local ok, autopairs = pcall(require, 'nvim-autopairs')

if not ok then
  local u = require 'utils'
  u.nok_plugin('nvim-autopairs')
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false,
  }
})

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
