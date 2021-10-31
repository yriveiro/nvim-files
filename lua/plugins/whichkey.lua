local wk = require("which-key")

wk.register({
  f = {
    name = "+Telescope",
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    r = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live Grep"},
    g = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Find Git Commit"},
  },
  t = { name = "+Floatterm" },
  b = { "<cmd>Vista!!<CR>", "Vista" },
  ["§"] = { ":NvimTreeFindFile<CR>", "Find file in NvimTree" }
}, { prefix = "<leader>" })

wk.register({
  t = {
    y = { ":tabnext<CR>", "Next tab"},
    r = { ":tabnext<CR>", "Previous tab"},
    n = { ":tabnew<CR>", "New Tab"}
  },
  ["§"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
  ch = { ":CloseHiddenBuffers<CR>", "Close Hidden Buffers" }
})

wk.register({
  e = { "<cmd>lua require('vim.diagnostic').show_line_diagnostics()<CR>", "Show Diagnostics" },
}, { prefix = "<localeader>" })
