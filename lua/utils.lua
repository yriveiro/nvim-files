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

-- Merge table 2 in table 1
function M.merge_table(t1, t2)
  for _,v in pairs(t2) do table.insert(t1, v) end
end

function M.trim(s)
  return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end

-- Borrowed from https://github.com/bartbes/inifile/blob/main/inifile.lua
function M.parse_inifile(path)
	local t = {}
	local section

  for line in assert(io.open(path)):lines() do
		-- Section headers
		local s = line:match("^%[([^%]]+)%]$")
		if s then
			section = s
			t[section] = t[section] or {}
		end

		-- Key-value pairs
		local key, value = line:match("^([%w_]+)%s-=%s-(.+)$")

		if tonumber(value) then value = tonumber(value) end
		if value == "true" then value = true end
		if value == "false" then value = false end
		if key and value ~= nil then
      value = M.trim(value)
			t[section][key] = value
    end
  end

  return t
end

function M.parse_dotenv(path)
	local t = {}

  for line in assert(io.open(path)):lines() do
		-- Key-value pairs
		local key, value = line:match("^([%w_]+)%s-=%s-(.+)$")
    value = M.trim(value)

		if tonumber(value) then value = tonumber(value) end
		if value == "true" then value = true end
		if value == "false" then value = false end
		if key and value ~= nil then
			t[key] = value
    end
  end

  return t
end

function M.file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

function M.git_root()
  return require('lspconfig.util').root_pattern('.git')(vim.loop.fs_realpath('.'))
end
return M
