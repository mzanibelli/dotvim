" Plugin
if exists('g:loaded_local_plugin_async')
    finish
endif
let g:loaded_local_plugin_async = 1

" Commands
command! -nargs=0 Jobs call async#ls()

" Mappings
nnoremap <silent> <Leader>j :<C-U>call async#ls()<CR>
