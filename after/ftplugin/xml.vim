" Ftplugin
if exists('b:loaded_local_ftplugin_xml')
    finish
endif
let b:loaded_local_ftplugin_xml = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler xml

" Mappings
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>

" Variables
let b:autoclose = ['tag', 'quote']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
