return {
  {
    'folke/snacks.nvim',
    opts = {
      picker = {
        sources = {
          files = { hidden = true, ignored = true },
          grep = { hidden = true, ignored = true },
          grep_word = { hidden = true, ignored = true },
          grep_buffers = { hidden = true, ignored = true },
        },
      },
    },
  },
  {
    'ibhagwan/fzf-lua',
    opts = {
      winopts = {
        preview = {
          title = false,
        },
      },
    },
  },
}
