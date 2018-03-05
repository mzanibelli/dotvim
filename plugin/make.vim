" Plugin
if exists('g:loaded_local_plugin_make')
    finish
endif
let g:loaded_local_plugin_make = 1

" Commands
command! -nargs=0 ToggleCompiler call make#toggle()

" Autocommands
augroup MAKE
    autocmd!
    autocmd BufWritePost * call make#auto(expand("<afile>"))
augroup END
