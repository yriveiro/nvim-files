let g:neosnippet#snippets_directory = join([$NVIM_HOME, "after/snippets"], "/")

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" vim:set ft=vim et sw=2:
