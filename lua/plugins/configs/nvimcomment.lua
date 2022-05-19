local ok, c = pcall(require, 'nvim-comment')

if not ok then
    return
end

c.setup {}
