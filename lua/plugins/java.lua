return {
  {
    'mfussenegger/nvim-jdtls',
    opts = {
      settings = {
        java = {
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompliedSources = true,
          },
          format = {
            settings = {
              url = '/Users/yagoriveiro/.config/java-style.xml',
            },
          },
        },
      },
    },
  },
}
