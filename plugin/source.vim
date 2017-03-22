" Plugin
if exists('g:loaded_local_source')
  finish
endif
let g:loaded_local_source = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Diff call source#exec("diff")
command! -nargs=0 Log call source#exec("log")
command! -nargs=0 Blame call source#exec("blame")
command! -nargs=0 Revert call source#exec("revert")
command! -nargs=0 Commit call source#exec("_commit")
command! -nargs=0 Update call source#exec("_update")
command! -nargs=0 Status call source#exec("_status")

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>

" Init
call source#init()
doautocmd User SourceDetectPost

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
