" Plugin
if exists('g:loaded_local_plugin_scratch')
    finish
endif
let g:loaded_local_plugin_scratch = 1

command! -complete=filetype -nargs=? Scratch call scratch#new(<q-args>)
