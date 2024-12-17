return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanion', 'CodeCompanionActions', 'CodeCompanionAdd', 'CodeCompanionChat' },
    opts = {
      strategies = {
        chat = {
          adapter = 'ollama',
          roles = {
            llm = '  CodeCompanion',
            user = ' us ',
          },
        },
        inline = {
          adapter = 'ollama',
        },
        agent = {
          adapter = 'ollama',
        },
      },
    },

    keys = {
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
      { '<leader>ap', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Prompt Actions (CodeCompanion)' },
      { '<leader>aa', '<cmd>CodeCompanionChat<cr>', mode = { 'n', 'v' }, desc = 'Toggle (CodeCompanion)' },
      { '<leader>ac', '<cmd>CodeCompanionAdd<cr>', mode = 'v', desc = 'Add code to CodeCompanion' },
      { '<leader>ai', '<cmd>CodeCompanion<cr>', mode = 'n', desc = 'Inline prompt (CodeCompanion)' },
    },
  },
}
