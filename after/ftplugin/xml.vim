" Ftplugin
if exists('b:loaded_local_ftplugin_xml')
  finish
endif
let b:loaded_local_ftplugin_xml = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -buffer -nargs=0 Minify call xml#minify()

" Mappings
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>

" Options
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Variables
let b:autoclose = ['tag', 'quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
