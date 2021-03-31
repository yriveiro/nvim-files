local lsp = vim.lsp
local sign_define = vim.fn.sign_define

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
