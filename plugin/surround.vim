" Mappings
vnoremap s. <Esc>`>a.<Esc>`<i.<Esc>
vnoremap s' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap s" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap s/ <Esc>`>a/<Esc>`<i/<Esc>
vnoremap s( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap s) <Esc>`>a)<Esc>`<i(<Esc>
vnoremap s[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap s] <Esc>`>a]<Esc>`<i[<Esc>
vnoremap s{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap s} <Esc>`>a}<Esc>`<i{<Esc>
vnoremap s< <Esc>`>a><Esc>`<i<<Esc>
vnoremap s` <Esc>`>a`<Esc>`<i`<Esc>
nnoremap <silent> <Leader>" :<C-U>Preserve s/'/"/g<CR>
nnoremap <silent> <Leader>' :<C-U>Preserve s/"/'/g<CR>

" Autocommands
augroup SURROUND
    autocmd!
    autocmd FileType * call surround#autoclose()
augroup END
