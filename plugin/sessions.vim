" Plugin
if exists('g:loaded_local_plugin_sessions')
    finish
endif
let g:loaded_local_plugin_sessions = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>, :<C-U>call sessions#load()<CR>

" Autocommands
augroup SESSIONS
    autocmd!
    autocmd VimLeave * call sessions#make()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
