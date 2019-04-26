" Plugin
if exists('g:loaded_local_plugin_git')
    finish
endif
let g:loaded_local_plugin_git = 1

" Commands
command! -nargs=* -complete=customlist,git#complete Git <mods> terminal ++close tig <args>
command! -range Blame echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")

" Mappings
nnoremap <silent> gl :<C-U>call git#log()<CR>
nnoremap <Leader>h :Git<Space>
