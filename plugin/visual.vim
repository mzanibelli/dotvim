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
vnoremap <silent> D :<C-U>call visual#duplicate()<CR>
vnoremap <silent> <C-N> :<C-U>call visual#down()<CR>
vnoremap <silent> <C-P> :<C-U>call visual#up()<CR>
vnoremap <silent> <Leader>a :<C-U>silent call visual#align()<CR>
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
inoremap <silent> <C-Y> <C-R><C-R>=visual#copy('up')<CR>
inoremap <silent> <C-E> <C-R><C-R>=visual#copy('down')<CR>
vnoremap <expr> <Tab> visual#function(1)
vnoremap <expr> <S-Tab> visual#function(0)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
