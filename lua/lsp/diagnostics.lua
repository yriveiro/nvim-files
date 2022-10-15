local d = vim.diagnostic
local sign_define = vim.fn.sign_define

d.config({
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
  virtual_text = {
    spacing = 2,
    source = 'always',
  },
}, nil)

-- custom signs
sign_define('DiagnosticSignError', {
  text = '',
  texthl = 'DiagnosticError',
  numhl = '',
})

sign_define('DiagnosticSignWarn', {
  text = '⚑',
  texthl = 'DiagnosticSignWarn',
  numhl = '',
  linehl = '',
})

sign_define('DiagnosticSignInfo', {
  text = 'ℹ',
  texthl = 'DiagnosticSignInfo',
  numhl = '',
})

sign_define('DiagnosticSignHint', {
  text = '',
  texthl = 'DiagnosticHint',
  numhl = '',
})
