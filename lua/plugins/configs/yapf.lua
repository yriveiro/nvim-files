local ok, yapf = pcall(require, 'yapf')

if not ok then
    return
end

yapf.setup {}
