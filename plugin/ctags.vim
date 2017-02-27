" Commands
command! -nargs=1 -complete=tag Tag call ctags#go(<q-args>)

" Mappings
nnoremap gt :<C-U>call ctags#go()<CR>
nnoremap gT <C-T>
