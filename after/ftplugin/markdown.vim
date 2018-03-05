" Ftplugin
if exists('b:loaded_local_ftplugin_markdown')
    finish
endif
let b:loaded_local_ftplugin_markdown = 1

" Compiler
compiler prettier

" Commands
if executable("pandoc")
    command! -buffer -nargs=0 Preview <mods> terminal ++close sh -c "pandoc -f markdown -t plain % | $PAGER"
endif

" Options
setlocal conceallevel=0
setlocal formatoptions=crqjtn
setlocal foldenable
setlocal formatprg=

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1
let b:completiontype = "\<C-X>\<C-K>"
