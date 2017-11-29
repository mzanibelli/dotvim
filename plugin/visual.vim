" Plugin
if exists('g:loaded_local_plugin_visual')
    finish
endif
let g:loaded_local_plugin_visual = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
vnoremap $ g_
nnoremap gV `[V`]
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
vnoremap <Tab> }
vnoremap <S-Tab> {

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
