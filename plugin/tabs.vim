" Plugin
if exists('g:loaded_local_plugin_tabs')
    finish
endif
let g:loaded_local_plugin_tabs = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>t :<C-U>tabnext<CR>
nnoremap <silent> <Leader>T :<C-U>tabprev<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
