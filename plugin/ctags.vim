" Plugin
if exists('g:loaded_local_plugin_ctags') || !executable("ctags")
    finish
endif
let g:loaded_local_plugin_ctags = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=1 -complete=tag Tag call ctags#go(<q-args>)
command! -nargs=1 -complete=customlist,ctags#complete Gentags call ctags#generate(<q-args>)

" Mappings
nnoremap gt :<C-U>call ctags#go()<CR>
nnoremap gT <C-T>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
