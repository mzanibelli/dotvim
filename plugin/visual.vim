" Plugin
if exists('g:loaded_local_plugin_visual')
    finish
endif
let g:loaded_local_plugin_visual = 1

" Mappings
nnoremap gV `[V`]
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
vnoremap <Tab> }
vnoremap <S-Tab> {
