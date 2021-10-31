local wk = require("which-key")

wk.register({
  f = {
    name = "+Telescope",
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    r = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live Grep"},
    g = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Find Git Commit"},
  },
  t = { name = "FloatTerm Toogle" },
  b = { "<cmd>Vista!!<CR>", "Vista" },
  ["§"] = { ":NvimTreeFindFile<CR>", "Find file in NvimTree" }
}, { prefix = "<leader>" })

wk.register({
  ["§"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }
})
