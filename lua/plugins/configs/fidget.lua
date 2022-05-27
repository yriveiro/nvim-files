local ok, fidget = pcall(require, 'fidget')
local n = require 'notify'

if not ok then
  n(' fidget not found', 'error', {
    title = 'Packer Nofification',
    fade_in_slide_out = 'slide',
  })

  return
end

fidget.setup {}
