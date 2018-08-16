" Ftplugin
if exists('b:loaded_local_ftplugin_xml')
    finish
endif
let b:loaded_local_ftplugin_xml = 1

" Compiler
compiler xml

" Options
setlocal matchpairs-=<:>
if executable("xmllint")
    setlocal formatprg=xmllint\ --format\ -
endif

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1
