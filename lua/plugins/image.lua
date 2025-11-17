return {
  {
    '3rd/image.nvim',
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          clear_in_insert_mode = true,
          download_remote_images = true,
          enabled = false,
          filetypes = { 'markdown' },
        },
      },
    },
  },
  {
    '3rd/diagram.nvim',
    event = 'VeryLazy',

    dependencies = {
      '3rd/image.nvim',
    },
    opts = {
      events = {
        render_buffer = {},
        clear_buffer = { 'BufLeave' },
      },
      renderer_options = {
        mermaid = {
          theme = 'dark',
          scale = 2,
          clear_in_insert_mode = true,
        },
      },
    },
    keys = {
      {
        '<LocalLeader>m',
        function()
          require('diagram').show_diagram_hover()
        end,
        mode = 'n',
        ft = { 'markdown' },
        desc = 'Show diagram in new tab',
      },
    },
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<LocalLeader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
    },
  },
  {
    'yriveiro/plantuml.nvim',
    dependencies = {
      '3rd/image.nvim',
    },
    keys = {
      { '<LocalLeader>pp', '<cmd>PlantUMLPreview<cr>', desc = 'Preview Plantuml file' },
    },
    config = function()
      require('plantuml').setup {}
    end,
  },
}
