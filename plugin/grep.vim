" Plugin
if exists('g:loaded_local_plugin_grep')
    finish
endif
let g:loaded_local_plugin_grep = 1

" Commands
command! -nargs=* Grep call grep#grep(<f-args>)

" Mappings
nnoremap <Leader>g :<C-U>Grep<Space>
