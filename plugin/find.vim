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

" Autocommands
augroup FIND
    autocmd!
    autocmd User DeferPost call find#configure()
augroup END

" Mappings
nnoremap <Leader>e :<C-U>Find<Space>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
