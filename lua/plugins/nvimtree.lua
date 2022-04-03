local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  open_on_tab         = true,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = { enable = true },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics         = {
    enabled     = true,
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = { '.git', 'node_modules', '.cache', '.terraform' }
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  filters = {
    dotfiles = true,
  },

  git = {
    enable = true,
    ignore = true,
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {
        { key = {"<CR>"}, cb = tree_cb("edit") },
        { key = {"+"},    cb = tree_cb("cd") },
        { key = "v",      cb = tree_cb("vsplit") },
        { key = "h",      cb = tree_cb("split") },
        { key = "t",      cb = tree_cb("tabnew") },
        { key = "<",      cb = tree_cb("prev_sibling") },
        { key = ">",      cb = tree_cb("next_sibling") },
        { key = "P",      cb = tree_cb("parent_node") },
        { key = "<BS>",   cb = tree_cb("close_node") },
        { key = "<S-CR>", cb = tree_cb("close_node") },
        { key = "<Tab>",  cb = tree_cb("preview") },
        { key = "K",      cb = tree_cb("first_sibling") },
        { key = "J",      cb = tree_cb("last_sibling") },
        { key = "I",      cb = tree_cb("toggle_ignored") },
        { key = "H",      cb = tree_cb("toggle_dotfiles") },
        { key = "R",      cb = tree_cb("refresh") },
        { key = "a",      cb = tree_cb("create") },
        { key = "d",      cb = tree_cb("remove") },
        { key = "r",      cb = tree_cb("rename") },
        { key = "<C-r>",  cb = tree_cb("full_rename") },
        { key = "x",      cb = tree_cb("cut") },
        { key = "c",      cb = tree_cb("copy") },
        { key = "p",      cb = tree_cb("paste") },
        { key = "y",      cb = tree_cb("copy_name") },
        { key = "Y",      cb = tree_cb("copy_path") },
        { key = "gy",     cb = tree_cb("copy_absolute_path") },
        { key = "<c",     cb = tree_cb("prev_git_item") },
        { key = ">c",     cb = tree_cb("next_git_item") },
        { key = "-",      cb = tree_cb("dir_up") },
        { key = "q",      cb = tree_cb("close") },
        { key = "?",      cb = tree_cb("toggle_help") },
      }
    }
  }
}

g.nvim_tree_add_trailing = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 0
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
g.nvim_tree_width = 50
