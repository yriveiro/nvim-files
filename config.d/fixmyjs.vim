" FIXMYJS

augroup FIXMYJS
  autocmd!
  autocmd Filetype javascript nnoremap <silent><leader>ff :call Fixmyjs()<CR>
augroup END

" vim:set ft=vim et sw=2:
