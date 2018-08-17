" Plugin
if exists('g:loaded_local_plugin_git')
    finish
endif
let g:loaded_local_plugin_git = 1

" Commands
command! -nargs=* -complete=file Git <mods> terminal ++close tig <args>

" Mappings
nnoremap <Leader>h :<C-U>Git<Space>
