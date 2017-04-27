" Plugin
if exists('g:loaded_local_plugin_find')
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
nnoremap <Leader>ff :<C-U>find<Space>
nnoremap <Leader>fs :<C-U>splitfind<Space>
nnoremap <Leader>fv :<C-U>vertical splitfind<Space>
nnoremap <Leader>fF :<C-U>find <C-R>=expand('%:h').'/'<CR>
nnoremap <Leader>fS :<C-U>splitfind <C-R>=expand('%:h').'/'<CR>
nnoremap <Leader>fV :<C-U>vertical splitfind <C-R>=expand('%:h').'/'<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
