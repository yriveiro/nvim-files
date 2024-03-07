return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      codelens = {
        enabled = true,
      },
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        ruff_lsp = {},
        pyright = {
          -- Disable hint capabilities to avoid duplicate hint with ruff_lsp.
          -- @see https://www.reddit.com/r/neovim/comments/11k5but/comment/jbjwwtf
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
            return capabilities
          end)(),
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'off',
              },
            },
          },
        },
        terraformls = {
          init_options = {
            terraform = {
              path = '/opt/homebrew/bin/terraform',
            },
          },
          capabilities = {
            experimental = {
              prefillRequiredFields = true,
              showReferencesCommandId = 'client.showReferences',
              referenceCountCodeLens = true,
              refreshModuleProviders = true,
              refreshModuleCalls = true,
              refreshTerraformVersion = true,
            },
          },
          settings = {
            terraformls = {
              timeout = 60,
            },
          },
        },
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require('schemastore').yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = '',
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                  'require',
                },
              },
            },
          },
        },
      },
    },
  },
  {
    'Afourcat/treesitter-terraform-doc.nvim',
    opts = {
      command_name = 'OpenDoc',
      url_opener_command = '!open',
      jump_argument = true,
    },
  },
}
