return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = 'all',
      ignore_install = { 'phpdoc' },
      sync_install = false,
      highlight = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
      },
    }

    -- D2 terrastruct grammar
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.d2 = {
      install_info = {
        url = 'https://github.com/pleshevskiy/tree-sitter-d2',
        revision = 'main',
        files = { 'src/parser.c', 'src/scanner.cc' },
      },
      filetype = 'd2',
    }
  end,
}
