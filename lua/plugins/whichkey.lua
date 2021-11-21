local wk = require("which-key")

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
  ch = { ":CloseHiddenBuffers<CR>", "Close Hidden Buffers" },
})


-- local leader
wk.register({
  ["0"] = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "LSP Docmument Symbol" },
  d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Definition" },
  e = { "<cmd>lua require('vim.diagnostic').show_line_diagnostics()<CR>", "Show Diagnostics" },
  f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP formatting" },
  h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
  r = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP References" },
  i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP Implementation" },
  td = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP Definition" },
  w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "LSP Workspace Symbol" },
  ["<c-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP Signature Help" },
  ["t"] = { "<cmd>lua require('termim').toggle()<CR>", "Termim" },
}, { prefix = "," })

wk.register({
  t = { t("<C-\\><C-N>:lua require('termim').toggle()<CR>"), "Termim" },
}, { prefix = ",", mode = "t" })
