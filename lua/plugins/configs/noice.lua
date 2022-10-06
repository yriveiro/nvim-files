local ok, noice = pcall(require, 'noice')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'noice'
  return
end

noice.setup {
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 1 },
      },
      size = {
        min_width = 80,
        width = "auto",
        height = "auto",
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}
