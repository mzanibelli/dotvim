" Plugin
if exists('g:loaded_local_plugin_git')
    finish
endif
let g:loaded_local_plugin_git = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Status <mods> terminal ++close git -p status
command! -nargs=+ -complete=file Diff <mods> terminal ++close git -p diff -- <args>
command! -nargs=+ -complete=file Log <mods> terminal ++close git -p log -- <args>


" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
