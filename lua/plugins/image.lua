return {
  {
    '3rd/image.nvim',
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { 'markdown', 'vimwiki' },
        },
      },
      max_width_window_percentage = 100,
      max_height_window_percentage = 100,
      scale_factor = 2.0,
    },
  },
  {
    '3rd/diagram.nvim',
    dependencies = {
      '3rd/image.nvim',
    },
    config = function()
      require('diagram').setup {
        integrations = {
          require 'diagram.integrations.markdown',
        },
        renderer_options = {
          mermaid = {
            theme = 'forest',
          },
          plantuml = {
            charset = 'utf-8',
          },
          d2 = {
            theme_id = 1,
          },
        },
      }
    end,
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
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
