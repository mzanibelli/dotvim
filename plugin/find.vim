" Plugin
if exists('g:loaded_local_plugin_find') || v:version < 800
    finish
endif
let g:loaded_local_plugin_find = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* -complete=file Find call find#find(<q-args>)

" Mappings
nnoremap <Leader>e :<C-U>Find<Space>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
