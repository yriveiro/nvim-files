return {
  {
    'nicholasmata/nvim-dap-cs',
    dependencies = { 'mfussenegger/nvim-dap' },
    opts = {
      netcoredbg = {
        -- the path to the executable netcoredbg which will be used for debugging.
        -- by default, this is the "netcoredbg" executable on your PATH.
        path = '/usr/local/netcoredbg',
      },
    },
  },
}
