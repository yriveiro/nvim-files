local wk = require 'which-key'

-- The function is called `t` for `termcodes`.
local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

wk.register({
  f = {
    name = "+Telescope",
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    r = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live Grep"},
    g = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Find Git Commit"},
  },
  t = { name = "+Floatterm" },
  b = { "<cmd>Vista!!<CR>", "Vista" },
  ["§"] = { ":NvimTreeFindFile<CR>", "Find file in NvimTree" },
}, { prefix = "<leader>" })

wk.register({
  t = {
    y = { ":tabnext<CR>", "Next tab"},
    r = { ":tabnext<CR>", "Previous tab"},
    n = { ":tabnew<CR>", "New Tab"}
  },
  ["§"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
})


-- local leader
wk.register({
  -- lsp
  l = {
    name = "+LSP",
    ["0"] = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "LSP Docmument Symbol" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Definition" },
    e = { "<cmd>lua require('vim.diagnostic').open_float()<CR>", "Show Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP formatting" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP References" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP Implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP Definition" },
    w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "LSP Workspace Symbol" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP Signature Help" },
  },

  t = { "<cmd>lua require('termim').toggle()<CR>", "Termim" },

  -- dap
  d = {
    name = "+DAP",
    c = { "<cmd>lua require('dap').continue()<CR>", "Continue/Start dap session" },
    a = { "<cmd>lua require('alpha.dap').new()<CR>", "Continue/Start dap session with args" },
    n = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
    i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
    o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
    b = {
      name = "+Breakpoint",
      a = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Add/Remove Breakpoint" },
      i = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>", "Breakpoint Condition" },
      m = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>", "Breakpoint Log Message" },
    },
    r = {
      name = "+RELP",
      o = { "<cmd>lua require('dap').repl.open()<CR>", "Open REPL" },
      l = {  "<cmd>lua require('dap').repl.run_last()<CR>", "Run last REPL" },
    },
    h = {  "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Variables Hover." },
    u = {  "<cmd>lua require('dapui').toggle()<CR>", "UI Toogle" },
  },

  -- telescope-dap
  f = {
    name = "+Telescope DAP",
    c = { "<cmd>lua require('telescope').extensions.dap.commands{}<CR>", "Commands" },
    s = { "<cmd>lua require('telescope').extensions.dap.configurations{}<CR>", "Configurations" },
    b = { "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<CR>", "List Breakpoints" },
    v = { "<cmd>lua require('telescope').extensions.dap.variables{}<CR>", "Variables" },
    f = { "<cmd>lua require('telescope').extensions.dap.frames{}<CR>", "Frames" },
  },
}, { prefix = "," })

wk.register({
  t = { t("<C-\\><C-N>:lua require('termim').toggle()<CR>"), "Termim" },
}, { prefix = ",", mode = "t" })
