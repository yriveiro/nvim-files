" :h defx
" ---
" Problems? https://github.com/Shougo/defx.nvim/issues

call defx#custom#option('_', {
  \ 'resume': 1,
  \ 'toggle': 1,
  \ 'winwidth': 40,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'columns': 'indent:git:icons:filename:size',
  \ 'root_marker': '',
  \ 'ignored_files':
  \      '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
  \      . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
  \      . ',.*'
  \ })

call defx#custom#column('git', {
  \ 'indicators': {
  \   'Modified': '•',
  \   'Staged': '✚',
  \   'Untracked': 'ᵁ',
  \   'Renamed': '≫',
  \   'Unmerged': '≠',
  \   'Ignored': 'ⁱ',
  \   'Deleted': '✖',
  \   'Unknown': '⁇'
  \ }
  \ })


call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })
call defx#custom#column('filename', { 'root_marker_highlight': 'Comment' })

" defx-icons plugin
let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''

" Internal use
let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')

" Events
" ---

augroup user_plugin_defx
  autocmd!

  " Define defx window mappings
  autocmd FileType defx call <SID>defx_mappings()

  " Delete defx if it's the only buffer left in the window
  autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

  " Move focus to the next window if current buffer is defx
  autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
augroup END


" Internal functions
" ---

function! s:defx_toggle_tree() abort
  " Open current file, or toggle directory expand/collapse
  if defx#is_directory()
          return defx#do_action('open_tree', ['nested', 'toggle'])
  endif
  return defx#do_action('multi', ['drop', 'quit'])
endfunction

function! s:defx_mappings() abort
  " Defx window keyboard mappings
  setlocal signcolumn=no expandtab


  nnoremap <silent><buffer><expr> o       defx#do_action('open_tree', 'recursive')
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree') :
  \ defx#do_action('multi', [['drop', 'vsplit']])
  nnoremap <silent><buffer><expr> t       defx#do_action('multi', [['drop', 'tabnew']])
  nnoremap <silent><buffer><expr> v       defx#do_action('multi', [['drop', 'vsplit']])
  nnoremap <silent><buffer><expr> h       defx#do_action('multi', [['drop', 'split']])
  nnoremap <silent><buffer><expr> P       defx#do_action('preview')
  nnoremap <silent><buffer><expr> y       defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')

  " Defx's buffer management
  nnoremap <silent><buffer><expr> q        defx#do_action('quit')
  nnoremap <silent><buffer><expr> se       defx#do_action('save_session')
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

  " File/dir management
  nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
  nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
  nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
  nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

  " Change directory
  nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
  nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
  nnoremap <silent><buffer><expr> <BS>    defx#async_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~       defx#async_action('cd')
  nnoremap <silent><buffer><expr> u       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> 2u      defx#do_action('cd', ['../..'])
  nnoremap <silent><buffer><expr> 3u      defx#do_action('cd', ['../../..'])
  nnoremap <silent><buffer><expr> 4u      defx#do_action('cd', ['../../../..'])

  " Selection
  nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr><nowait> <Space>
          \ defx#do_action('toggle_select') . 'j'

  nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
  nnoremap <silent><buffer><expr> C
          \ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')

  " Tools
  nnoremap <silent><buffer><expr> w       defx#do_action('call', '<SID>toggle_width')
  nnoremap <silent><buffer><expr> gd      defx#async_action('multi', ['drop', 'quit', ['call', '<SID>git_diff']])
endfunction

" TOOLS
" ---

function! s:git_diff(context) abort
  Gdiffsplit
endfunction

function! s:toggle_width(context) abort
  " Toggle between defx window width and longest line
  let l:max = 0
  for l:line in range(1, line('$'))
          let l:len = strdisplaywidth(substitute(getline(l:line), '\s\+$', '', ''))
          let l:max = max([l:len + 5, l:max])
  endfor
  let l:new = l:max == winwidth(0) ? s:original_width : l:max
  call defx#call_action('resize', l:new)
endfunction

nnoremap <silent> <leader>§ :Defx<cr>

" vim:set ft=vim et sw=2:
