local ok, gwt = pcall(require, 'git-worktree')

if not ok then
  local u = require 'utils'
  u.nok_plugin 'git-worktree'
  return
end

gwt.setup {}

local n = require 'notify'

gwt.on_tree_change(function(op, meta)
  if op == gwt.Operations.Switch then
    n.notify(
      "Switched from " .. meta.prev_path .. " to " .. meta.path,
      'info',
      {
        title = 'Git Worktree Nofification',
        fade_in_slide_out = 'slide',
      })
  end
end)
