require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = require('schemastore').json.schemas {
        select = {
          'docker-compose.yml',
        },
      },
    },
  }
}
