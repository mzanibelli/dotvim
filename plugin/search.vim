" Plugin
if exists('g:loaded_local_plugin_search')
    finish
endif
let g:loaded_local_plugin_search = 1

" Mappings
nnoremap gs [I
nnoremap gS [D
nnoremap <expr> <Leader>: search#replace(0)
vnoremap <expr> <Leader>: search#replace(1)
nnoremap <silent> <Leader><Leader> :<C-U>nohlsearch<Bar>diffupdate<Bar>syntax sync fromstart<CR><C-L>
nnoremap <silent> * :<C-U>let view = winsaveview()<CR>*:call winrestview(view)<CR>
nnoremap <silent> # :<C-U>let view = winsaveview()<CR>#:call winrestview(view)<CR>
vnoremap <silent> * :<C-U>call search#selection()<CR>//<CR><C-O>:set hlsearch<CR>
vnoremap <silent> # :<C-U>call search#selection()<CR>??<CR><C-O>:set hlsearch<CR>
nnoremap <silent> g* :<C-U>call search#toqf()<CR>
nmap c* *cgn
nmap c# #cgn
