return {
  {
    'obsidian-nvim/obsidian.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = { 'markdown', 'alpha' },
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/vaults/*/**.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/vaults/*/**.md',
    },
    keys = {
      {
        mode = { 'n' },
        '<LocalLeader>ok',
        '<cmd>ObsidianDailies<cr>',
        desc = 'Open dailies',
      },
      {
        mode = { 'n' },
        '<LocalLeader>oc',
        '<cmd>ObsidianNew<cr>',
        desc = 'Create new note',
      },
      {
        mode = { 'n' },
        '<LocalLeader>oq',
        '<cmd>ObsidianQuickSwitch<cr>',
        desc = 'Switch Notes',
      },
      {
        mode = { 'n' },
        '<LocalLeader>os',
        '<cmd>ObsidianSearch<cr>',
        desc = 'Search Notes',
      },
      {
        mode = { 'n' },
        '<LocalLeader>ot',
        '<cmd>ObsidianToday<cr>',
        desc = 'Today Note',
      },
      {
        mode = { 'n' },
        '<LocalLeader>oy',
        '<cmd>ObsidianYesterday<cr>',
        desc = 'Yesterday Note',
      },
      {
        mode = { 'n' },
        '<LocalLeader>ol',
        '<cmd>ObsidianToggleCheckbox<cr>',
        desc = 'Ciclyng checkbox',
      },
      {
        mode = { 'n' },
        '<LocalLeader>of',
        '<cmd>ObsidianFollowLink<cr>',
        desc = 'Follow Link',
      },
      {
        mode = { 'n' },
        '<LocalLeader>g',
        function()
          return require('obsidian').util.gf_passthrough()
        end,
        desc = 'Follow link (gf passthrough)',
        expr = true,
        buffer = true,
      },
      {
        mode = { 'n' },
        '<LocalLeader>oe',
        function()
          require('obsidian').util.toggle_checkbox()

          -- Go EOL
          local row, _ = unpack(vim.api.nvim_win_get_cursor(0)) -- Get current cursor position
          local line = vim.api.nvim_get_current_line() -- Get the content of the current line

          vim.api.nvim_win_set_cursor(0, { row, #line }) -- Set the cursor to the end of the current line_hl_group
          vim.api.nvim_set_current_line(line .. '')
          vim.api.nvim_feedkeys('a', 'n', true)
        end,
        desc = 'Create checkboxe entry',
        buffer = true,
      },
    },
    opts = {
      workspaces = {
        {
          name = 'work',
          path = '~/vaults/work',
        },
      },
      notes_subdir = 'notes',
      new_notes_location = 'notes_subdir',
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'notes/dailies',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },
      -- templates = {
      --   subdir = 'templates',
      --   date_format = '%Y-%m-%d',
      --   time_format = '%H:%M',
      --   -- A map for custom variables, the key should be the variable and the value a function
      --   substitutions = {
      --     alias = { '%MMMM %d, %yyyy' },
      --   },
      -- },
      ui = {
        enable = false, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        -- Define how various check-boxes are displayed
        checkbox = {
          order = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
            ['x'] = { char = '', hl_group = 'ObsidianDone' },
            ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
            ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          },
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = '•', hl_group = 'ObsidianBullet' },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        block_ids = { hl_group = 'ObsidianBlockID' },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianBullet = { bold = true, fg = '#89ddff' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianBlockID = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = 'assets/imgs', -- This is the default
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
      },
    },
  },
}
