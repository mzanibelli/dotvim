" Commands
command! -buffer -nargs=0 Functions call qf#qfdo('call source#functions()')
command! -nargs=* Diff call source#exec("diff")
command! -nargs=* Log call source#exec("log")
command! -nargs=0 Blame call source#exec("blame")
command! -nargs=0 Revert call source#exec("revert")
command! -nargs=0 Commit call source#exec("commit")
command! -nargs=0 Update call source#exec("update")
command! -nargs=0 Status call source#exec("status")

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>

" Init
silent call source#root()
