local lsp = vim.lsp
local sign_define = vim.fn.sign_define
local hi = vim.highlight

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = false,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
    }
  }
)

-- custom signs
sign_define(
  "LspDiagnosticsSignError",
  {
    text = "",
    texthl = "LspDiagnosticsError"
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = "⚑",
    texthl = "LspDiagnosticsWarning"
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = "ℹ",
    texthl = "LspDiagnosticsInformation"
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = "",
    texthl = "LspDiagnosticsHint"
  }
)

-- Force default to ensure the user theme didn't cleared them
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
-- Force relink with default hi groups
hi.link("LspDiagnosticsError", "LspDiagnosticsDefaultError", false)
hi.link("LspDiagnosticsWarning", "LspDiagnosticsDefaultWarning", false)
hi.link("LspDiagnosticsInformation", "LspDiagnosticsDefaultInformation", false)
hi.link("LspDiagnosticsHint", "LspDiagnosticsDefaultHint", false)
