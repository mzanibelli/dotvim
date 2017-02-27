" Commands
command! -buffer -nargs=0 Functions call qf#qfdo('call source#functions()')

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>

" Init
silent call source#root("svn")
silent call source#root("git")
