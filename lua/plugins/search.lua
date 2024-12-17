return {
  {
    'ibhagwan/fzf-lua',
    opts = function(_, opts)
      opts.winopts.preview.title = false

      return opts
    end,
  },
}
