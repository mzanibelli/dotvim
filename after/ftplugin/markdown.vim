" Ftplugin
if exists('b:loaded_local_ftplugin_markdown')
    finish
endif
let b:loaded_local_ftplugin_markdown = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler prettier

" Commands
if executable("md.sh")
    command! -buffer -nargs=0 Preview vertical terminal ++close md.sh %
endif

" Options
setlocal conceallevel=0
setlocal formatoptions=crqjtn

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1
let b:completiontype = "\<C-X>\<C-K>"

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
