" Ftplugin
if exists('b:loaded_local_ftplugin_xml')
    finish
endif
let b:loaded_local_ftplugin_xml = 1

" Compiler
compiler xml

" Mappings
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>

" Options
setlocal matchpairs-=<:>
if executable("xmllint")
    setlocal formatprg=xmllint\ --format\ -
endif

" Variables
let b:autoclose = ['tag', 'quote']
let b:autocompile = 1
