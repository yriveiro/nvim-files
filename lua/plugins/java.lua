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
          saveActions = {
            organizeImports = true,
          },
          format = {
            settings = {
              url = '/Users/yagoriveiro/.config/java-style.xml',
            },
          },
        },
      },
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
            },
          },
        },
      },
    },
  },
}
