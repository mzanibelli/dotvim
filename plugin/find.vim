" Plugin
if exists('g:loaded_local_plugin_find') || !executable('fd')
    finish
endif
let g:loaded_local_plugin_find = 1

" Commands
command! -nargs=* Find call find#find(<f-args>)

" Mappings
nnoremap <Leader>f :<C-U>Find<Space>
