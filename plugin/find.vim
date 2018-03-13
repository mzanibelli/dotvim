" Plugin
if exists('g:loaded_local_plugin_find')
    finish
endif
let g:loaded_local_plugin_find = 1

" Commands
command! -nargs=* Find call find#find(<f-args>)

" Autocommands
augroup FIND
    autocmd!
    autocmd User DeferPost call find#configure()
augroup END

" Mappings
nnoremap <Leader>f :<C-U>Find<Space>
