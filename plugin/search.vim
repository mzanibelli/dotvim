" Plugin
if exists('g:loaded_local_plugin_search')
    finish
endif
let g:loaded_local_plugin_search = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap gs [I
nnoremap gS [D
nnoremap <expr> <Leader>: search#replace(0)
vnoremap <expr> <Leader>: search#replace(1)
nnoremap <silent> <Leader><Leader> :<C-U>noh<CR>
nnoremap <silent> * :<C-U>let view = winsaveview()<CR>*:call winrestview(view)<CR>
nnoremap <silent> # :<C-U>let view = winsaveview()<CR>#:call winrestview(view)<CR>
vnoremap <silent> * :<C-U>call search#selection()<CR>//<CR><C-O>:set hlsearch<CR>
vnoremap <silent> # :<C-U>call search#selection()<CR>??<CR><C-O>:set hlsearch<CR>
nnoremap <silent> g* :<C-U>call search#toqf()<CR>
nmap c* *cgn
nmap c# #cgn

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
