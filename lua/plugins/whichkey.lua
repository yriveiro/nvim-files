local wk = require("which-key")

wk.register({
  ff = { name = "Telescope Find Files"  },
  fr = { name = "Telescope Live Grep"  },
  fg = { name = "Telescope Git Commits"  },
  t = { name = "FloatTerm Toogle" },
}, { prefix = "<leader>" })
