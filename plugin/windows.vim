" Plugin
if exists('g:loaded_local_plugin_windows')
    finish
endif
let g:loaded_local_plugin_windows = 1

" Mappings
nnoremap <Leader>v <C-W>v
nnoremap <Leader>s <C-W>s
nnoremap <Leader>o <C-W>o
nnoremap <Leader>c <C-W>c
nnoremap <Leader>= <C-W>=
nnoremap <Leader>_ <C-W>_
nnoremap <Leader>- <C-W>\|
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j
vnoremap <C-H> <C-W>h
vnoremap <C-L> <C-W>l
vnoremap <C-K> <C-W>k
vnoremap <C-J> <C-W>j

" Autocommands
augroup WINDOWS
    autocmd!
    autocmd VimResized * wincmd =
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists("b:winview") && !&diff | call winrestview(b:winview) | endif
augroup END
