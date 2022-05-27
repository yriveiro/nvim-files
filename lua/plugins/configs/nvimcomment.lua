local ok, c = pcall(require, 'nvim_comment')
local n = require 'notify'

if not ok then
  n(' nvim-comment not found', 'error', {
    title = 'Packer Nofification',
    fade_in_slide_out = 'slide',
  })

  return
end

c.setup {}
