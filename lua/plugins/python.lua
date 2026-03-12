return {
  -- Make sure to import the python extra first
  { import = 'lazyvim.plugins.extras.lang.python' },

  -- Configure lspconfig to set up ty
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      -- Ensure ty is configured
      opts.servers.ty = opts.servers.ty or {}
      opts.servers.ty.enabled = true

      -- Disable other Python LSPs explicitly
      opts.servers.pyright = opts.servers.pyright or {}
      opts.servers.pyright.enabled = false

      opts.servers.basedpyright = opts.servers.basedpyright or {}
      opts.servers.basedpyright.enabled = false

      -- Keep ruff enabled
      opts.servers.ruff = opts.servers.ruff or {}
      opts.servers.ruff.enabled = true

      -- Ensure ruff doesn't provide hover (let ty handle that)
      opts.setup = opts.setup or {}
      opts.setup.ruff = function()
        require('snacks').util.lsp.on({ name = 'ruff' }, function(_, client)
          client.server_capabilities.hoverProvider = false
        end)
      end
    end,
  },
}
