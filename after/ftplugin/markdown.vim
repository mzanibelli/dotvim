" Ftplugin
if exists('b:loaded_local_ftplugin_markdown')
    finish
endif
let b:loaded_local_ftplugin_markdown = 1

" Compiler
compiler markdown

" Commands
command! -buffer -nargs=0 Preview call preview#toggle()

" Options
setlocal conceallevel=0
setlocal formatoptions=crqjtn
setlocal formatprg=
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal spell

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1
let b:completiontype = "\<C-X>\<C-K>"
