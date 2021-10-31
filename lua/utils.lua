local M = {}

function M.is_buffer_empty()
  -- Check whether the current buffer is empty.
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function M.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns.
  return vim.fn.winwidth(0) / 2 > cols
end

function M.replace_termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
 end


function M.dump(o)
  -- Dump a table for easy debug.
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
     return tostring(o)
  end
end

return M
