" Commands
command! -buffer -nargs=0 Functions call qf#qfdo('call source#functions()')
command! -nargs=* Diff call source#exec("diff")
command! -nargs=* Log call source#exec("log")
command! -nargs=0 Blame call source#exec("blame")
command! -nargs=0 Revert call source#exec("revert")

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>
nnoremap <silent> <Leader>? :<C-U>call source#exec("diff")<CR>
nnoremap <silent> <Leader>+ :<C-U>call source#exec("log")<CR>
nnoremap <silent> <Leader>! :<C-U>call source#exec("blame")<CR>
nnoremap <silent> <Leader>$ :<C-U>call source#exec("revert")<CR>

" Init
silent call source#root()
