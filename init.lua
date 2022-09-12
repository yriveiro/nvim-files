-- Yago Riveiro's vim configuration
--
-- Overarching Philosophy:
-- 1. Prefer the defaults
-- 2. Extend functionality where needed
-- 3. Change functionality only when it doesn't make sense

local ok, impatient = pcall(require, 'impatient')

if ok then
  impatient.enable_profile()
end

sources = {
  'settings', -- Vim settings
  'plugins', -- Packer plugins
  'lsp', -- LSP configuration
  'mappings', -- Vim mappings
  'autocmds', -- Magic from autocommands
  'commands', -- custom commands
}

for _, source in ipairs(sources) do
  local ok, err = pcall(require, source)
  if not ok then
    vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. err)
  end
end
