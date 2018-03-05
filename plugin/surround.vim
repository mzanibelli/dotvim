" Plugin
if exists('g:loaded_local_plugin_surround')
    finish
endif
let g:loaded_local_plugin_surround = 1

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

" Autocommands
augroup SURROUND
    autocmd!
    autocmd FileType * call surround#autoclose()
augroup END
