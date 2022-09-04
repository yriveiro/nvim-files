local ok, nt = pcall(require, 'neo-tree')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'neo-tree'
  return
end

local icons = require 'icons'

nt.setup {
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = icons.gitAdd, -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = icons.gitChange, -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = icons.gitDeleted, -- this can only be used in the git_status source
        renamed = icons.gitRenamed, -- this can only be used in the git_status source
        -- Status type
        untracked = icons.gitUntracked,
        ignored = icons.gitIgnored,
        unstaged = icons.gitUnstaged,
        staged = icons.gitStaged,
        conflict = icons.gitUnmerged,
      },
    },
  },
  window = {
    mappings = {
      ['v'] = 'open_vsplit',
      ['h'] = 'open_split',
      ['s'] = 'open_with_window_picker',
    },
  },
}
