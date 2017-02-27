" Mappings
inoremap {<CR> {<CR><BS>}<Esc>O
inoremap ["" [""]<Left><Left>
inoremap ['' ['']<Left><Left>
inoremap <expr> " default#mapdouble('"', "\"\<Left>")
inoremap <expr> ' default#mapdouble("'", "'\<Left>")
inoremap {{}} {{<Space><Space>}}<Left><Left><Left>
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
nnoremap <silent> <Leader>" :<C-U>windows#preserve s/'/"/g<CR>
nnoremap <silent> <Leader>' :<C-U>windows#preserve s/"/'/g<CR>
