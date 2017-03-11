let $NVIM_HOME="~/.config/nvim"
let $NVIM_PLUGGED= join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG= join([$NVIM_HOME, "config.d"], "/")

"" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

Plug 'scrooloose/nerdtree' | Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()

"" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor
