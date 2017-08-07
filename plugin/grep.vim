" Plugin
if exists('g:loaded_local_plugin_grep')
    finish
endif
let g:loaded_local_plugin_grep = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>g :<C-U>call grep#word()<CR>
nnoremap <silent> <Leader>G :<C-U>call grep#WORD()<CR>
vnoremap <silent> <Leader>g :<C-U>call grep#visual()<CR>

" Autocommands
augroup GREP
    autocmd!
    autocmd User DeferPost call grep#configure()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
