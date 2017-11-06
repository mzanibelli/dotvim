" Plugin
if exists('g:loaded_local_plugin_grep')
    finish
endif
let g:loaded_local_plugin_grep = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* Grep call grep#grep(<f-args>)

" Mappings
nnoremap <Leader>g :<C-U>Grep<Space>

" Autocommands
augroup GREP
    autocmd!
    autocmd User DeferPost call grep#configure()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
