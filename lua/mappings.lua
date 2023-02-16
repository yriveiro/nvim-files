local ok, wk = pcall(require, 'which-key')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'which-key'
  return
end

-- The function is called `t` for `termcodes`.
local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local snapshot_path = os.getenv("HOME")

wk.register({
  f = {
    name = '+Telescope',
    c = { "<cmd>lua require('cheatsh'):search()<CR>", 'Cheat.sh' },
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", 'Diagnostics' },
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find File' },
    g = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", 'Find Git Commit' },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<CR>", 'Notify notifications' },
    p = { "<cmd>lua require('telescope').extensions.project.project()<CR>", 'Projects' },
    r = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", 'Live Grep' },
    t = { '<cmd>TodoTelescope<CR>', 'Todo comments notifications' },
    w = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", 'Git Worktree' },
  },
  v = { '<cmd>Vista!!<CR>', 'Vista' },
  y = { '<cmd>Yapf<CR>', 'Yapf, Python formatter' },
  w = { '<cmd>lua PickWindow()<CR>', 'Window Picker' },
  ['§'] = { ':NeoTreeReveal<CR>', 'Find file in NeoTree' },
  ['º'] = { ':NeoTreeReveal<CR>', 'Find file in NeoTree' },
  p = {
    name = '+Packer',
    s = { "<cmd>PackerSnapshot " .. snapshot_path .. "/.packer/snapshots/" .. os.time(os.date("!*t")) .. " <CR>", 'Do snapshot' },
  },
  n = {
    name = 'Noice',
    n = {'<cmd>Noice<CR>', 'Noice'},
    l = {'<cmd>Noice last<CR>', 'Noice'},
    h = {'<cmd>Noice history<CR>', 'Noice'},
  },
}, { prefix = '<leader>' })

wk.register {
  t = {
    y = { ':tabnext<CR>', 'Next tab' },
    r = { ':tabprev<CR>', 'Previous tab' },
    n = { ':tabnew<CR>', 'New Tab' },
  },
  ['§'] = { ':NeoTreeFocusToggle<CR>', 'Toggle Neotree' },
  ['<space>'] = { ':Telescope file_browser<CR>', 'File Browser' },
}

-- local leader
wk.register({
  -- lsp
  l = {
    name = '+LSP',
    ['0'] = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'LSP Docmument Symbol' },
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP Definition' },
    e = { "<cmd>lua require('vim.diagnostic').open_float()<CR>", 'Show Diagnostics' },
    f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'LSP formatting' },
    h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP Hover' },
    r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP References' },
    ['.'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP Rename' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'LSP Implementation' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP Definition' },
    w = { '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'LSP Workspace Symbol' },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'LSP Signature Help' },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", 'LSP Code Action' },
  },

  t = { "<cmd>lua require('termim').toggle()<CR>", 'Termim' },

  -- dap
  d = {
    name = '+DAP',
    c = { "<cmd>lua require('dap').continue()<CR>", 'Continue/Start dap session' },
    a = { "<cmd>lua require('alpha.dap').new()<CR>", 'Continue/Start dap session with args' },
    n = { "<cmd>lua require('dap').step_over()<CR>", 'Step Over' },
    i = { "<cmd>lua require('dap').step_into()<CR>", 'Step Into' },
    o = { "<cmd>lua require('dap').step_out()<CR>", 'Step Out' },
    b = {
      name = '+Breakpoint',
      a = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", 'Add/Remove Breakpoint' },
      i = {
        '<cmd>lua require(\'dap\').set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
        'Breakpoint Condition',
      },
      m = {
        '<cmd>lua require(\'dap\').set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
        'Breakpoint Log Message',
      },
    },
    r = {
      name = '+RELP',
      o = { "<cmd>lua require('dap').repl.open()<CR>", 'Open REPL' },
      l = { "<cmd>lua require('dap').repl.run_last()<CR>", 'Run last REPL' },
    },
    h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", 'Variables Hover.' },
    u = { "<cmd>lua require('dapui').toggle()<CR>", 'UI Toogle' },
  },

  -- telescope-dap
  f = {
    name = '+Telescope DAP',
    c = { "<cmd>lua require('telescope').extensions.dap.commands{}<CR>", 'Commands' },
    s = { "<cmd>lua require('telescope').extensions.dap.configurations{}<CR>", 'Configurations' },
    b = { "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<CR>", 'List Breakpoints' },
    v = { "<cmd>lua require('telescope').extensions.dap.variables{}<CR>", 'Variables' },
    f = { "<cmd>lua require('telescope').extensions.dap.frames{}<CR>", 'Frames' },
  },
}, { prefix = ',' })

wk.register({
  t = { t "<C-\\><C-N>:lua require('termim').toggle()<CR>", 'Termim' },
}, { prefix = ',', mode = 't' })
