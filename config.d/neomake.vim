let g:neomake_open_list = 2
let g:neomake_list_height = 10
let g:neomake_logfile = '/tmp/neovim/neomake.log'
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_erro = 1
let g:neomake_php_enabled_makers = ['php']
let g:neomake_Dockerfile_enabled_makers = ['hadolint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_r_enabled_makers = ['lintr']
let g:neomake_python_enabled_makers = ['flake8', 'mypy']

let g:neomake_php_phpcs_args_standard = 'PSR1,PSR2'

let g:neomake_hadolint_exe = '/usr/local/bin/hadolint'
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" vim:set ft=vim et sw=2:
