command! -buffer -nargs=0 Functions call qf#qfdo('call source#functions()')
command! -nargs=1 Scope call cscope#go(<q-args>)
command! -nargs=1 -complete=tag Tag call ctags#go(<q-args>)

nnoremap gt :<C-U>call ctags#go()<CR>
nnoremap gT <C-T>
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>
nnoremap \<Leader>th :\<C-U>call cscope#menu()\<CR>:Scope<Space>

for char in [ "c", "d", "g", "s", "t", "e", "i", "a", "f"]
    execute 'nnoremap <Leader>t'.char.' :<C-U>call cscope#go("'.char.'")<CR>'
endfor

silent call source#root("svn")
silent call source#root("git")
