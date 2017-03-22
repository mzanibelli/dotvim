" Plugin
if exists('g:loaded_local_plugin_ctags')
  finish
endif
let g:loaded_local_plugin_ctags = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=1 -complete=tag Tag call ctags#go(<q-args>)

" Mappings
nnoremap gt :<C-U>call ctags#go()<CR>
nnoremap gT <C-T>
nnoremap <silent> <Leader>! :<C-U>call ctags#generate()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
