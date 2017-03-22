" Plugin
if exists('g:loaded_local_plugin_surround')
  finish
endif
let g:loaded_local_plugin_surround = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

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

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
