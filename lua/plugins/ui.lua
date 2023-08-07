return {
  {
    'mg979/vim-visual-multi',
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      lazy = true,
    },
    config = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end

      ---@type UfoFoldingRangeKind
      local kinds = { 'imports', 'comment' }

      require('ufo').setup {
        enable_get_fold_virt_text = true,
        preview = {},
        open_fold_hl_timeout = 150,
        close_fold_kinds = kinds,
        fold_virt_text_handler = handler,
        filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
  {
    'm4xshen/smartcolumn.nvim',
    opts = {
      disabled_filetypes = {
        'help',
        'text',
        'markdown',
        'alpha',
        'lazy',
        'mason',
        'neorg',
      },
      custom_colorcolumn = {
        python = { '120', '200' },
      },
    },
  },
  -- Custom configurations for LazyVim ones
  {
    'goolord/alpha-nvim',
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button('m', '󰏓 ' .. ' Mason', ':Mason <CR>')
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
      table.insert(dashboard.section.buttons.val, 9, button)
    end,
  },
}
