" Ftplugin
if exists('b:loaded_local_ftplugin_help')
    finish
endif
let b:loaded_local_ftplugin_help = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <buffer> <Esc> :<C-U>call help#back()<CR>
nnoremap <silent> <buffer> gt :<C-U>Help <C-R><C-W><CR>

" Options
setlocal bufhidden=wipe

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
