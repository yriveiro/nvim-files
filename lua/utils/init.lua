local _M = {}

_M.signs = { Error = "", Warn = "", Hint = "", Info = "" }

_M.is_buffer_empty = function()
  -- Check whether the current buffer is empty.
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
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

return _M
