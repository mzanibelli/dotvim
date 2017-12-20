" Plugin
if exists('g:loaded_local_plugin_ranger')
    finish
endif
let g:loaded_local_plugin_ranger = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <Leader>r :<C-U>Ranger<Space>

" Commands
command! -nargs=? -complete=file Ranger call ranger#open(<f-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
