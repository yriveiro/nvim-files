"" Configurations
"
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
    \ },
  \ 'fallback': "rg %s --files | grep -Ev '" + g:ctrlp_custom_ignore + "'"
  \ }

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $NVIM_HOME . '/.cache/ctrlp'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_lazy_update = 350

set wildmode=list:longest
set wildignore+=*.so,*.swp,*.zip,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" vim:set ft=vim et sw=2:
