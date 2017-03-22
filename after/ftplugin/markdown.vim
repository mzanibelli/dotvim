" Ftplugin
if exists('b:loaded_local_ftplugin_markdown')
    finish
endif
let b:loaded_local_ftplugin_markdown = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <buffer> <Leader>x :<C-U>call markdown#render()<CR>

" Variables
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
