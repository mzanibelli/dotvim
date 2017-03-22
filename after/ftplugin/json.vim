" Ftplugin
if exists('b:loaded_local_ftplugin_json')
    finish
endif
let b:loaded_local_ftplugin_json = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -buffer -nargs=0 Minify call json#minify()

" Options
setlocal conceallevel=0
setlocal formatprg=python\ -m\ json.tool

" Variables
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
