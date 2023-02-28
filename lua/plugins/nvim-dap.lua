return {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    {
      'rcarriga/nvim-dap-ui',
      lazy = true,
    },
    {
      'yriveiro/dap-go.nvim',
      lazy = true,
    },
    {
      'theHamsta/nvim-dap-virtual-text',
      lazy = true,
    },
  },
  config = function()
    require('dapui').setup()
    require('dap-go').setup { external_config = { enabled = true } }
    require('nvim-dap-virtual-text').setup()

    local dap = require 'dap'
    local dapui = require 'dapui'
    local fn = vim.fn

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    -- Customize dap signs
    fn.sign_define('DapBreakpoint', { text = '✋', texthl = '', linehl = '', numhl = '' })

    dap.configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
        host = function()
          local value = vim.fn.input 'Host [127.0.0.1]: '
          if value ~= '' then
            return value
          end
          return '127.0.0.1'
        end,
        port = function()
          local val = tonumber(vim.fn.input 'Port: ')
          assert(val, 'Please provide a port number')
          return val
        end,
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback { type = 'server', host = config.host, port = config.port }
    end
  end,
}