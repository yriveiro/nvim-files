"" Configurations
"

set guifont=Monaco\ for\ Powerline\ Nerd\ Font:11:cANSI

set showcmd                       " Show (partial) command in status line.
set number                        " Line numbers
set relativenumber                " Line relative numbers
set termguicolors                 " Enable true colors
set synmaxcol=2048                " Set a limit for syntax highlights
set laststatus=2                  " Display the status line always
set linespace=0                   " Set line-spacing to minimum.
set showmode                      " Show current mode.
set cursorline                    " Highlight the screen line of the cursor.
set splitbelow
set splitright                    " Split configurations
set dir=/tmp
set wildmode=list:longest,list:full
set completeopt=menuone,longest,preview

hi NonText ctermfg=7 guifg=gray

" Themes
"
colorscheme nova

if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=7 guibg=red
endif

" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" PHPCS
augroup phpcs_configuration
  autocmd filetype php let g:php_cs_fixer_path='/usr/local/bin/php-cs-fixer'
  autocmd filetype php let g:php_cs_fixer_level='psr2'
  autocmd filetype php let g:php_cs_fixer_fixers_list='PSR2,concat_with_spaces,short_array_syntax'
  autocmd filetype php let g:php_cs_fixer_php_path='/usr/local/bin/php'
  autocmd filetype php nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>
augroup END

nnoremap <silent> <leader>sh :terminal<CR>
nnoremap <silent> <leader>cb :CloseHiddenBuffers<CR>

autocmd BufWritePost,BufEnter * Neomake

" vim:set ft=vim et sw=2:
