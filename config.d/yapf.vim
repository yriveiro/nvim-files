" YAPF

augroup YAPF
  autocmd!
  autocmd Filetype python nnoremap <silent><leader>yf :call yapf#YAPF()<CR>
augroup END

" vim:set ft=vim et sw=2:
