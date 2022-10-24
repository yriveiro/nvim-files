local n = require 'notify'
local _M = {}

_M.is_buffer_empty = function()
  -- Check whether the current buffer is empty.
  return vim.fn.empty(vim.fn.expand '%:t') == 1
end

_M.has_width_gt = function(cols)
  -- Check if the windows width is greater than a given number of columns.
  return vim.fn.winwidth(0) / 2 > cols
end

_M.table = {
  some = function(tbl, cb)
    for k, v in pairs(tbl) do
      if cb(k, v) then
        return true
      end
    end
    return false
  end,
}

_M.nok_plugin = function(p)
  n.notify(" Plugin '" .. p .. "' not found", 'error', {
    title = 'Packer Nofification',
    fade_in_slide_out = 'slide',
  })
end

_M.dump = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. _M.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return _M
