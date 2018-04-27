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
nnoremap <silent> <C-H> :<C-U>call windows#move('h')<CR>
nnoremap <silent> <C-L> :<C-U>call windows#move('l')<CR>
nnoremap <silent> <C-K> :<C-U>call windows#move('k')<CR>
nnoremap <silent> <C-J> :<C-U>call windows#move('j')<CR>
vnoremap <silent> <C-H> :<C-U>call windows#move('h')<CR>
vnoremap <silent> <C-L> :<C-U>call windows#move('l')<CR>
vnoremap <silent> <C-K> :<C-U>call windows#move('k')<CR>
vnoremap <silent> <C-J> :<C-U>call windows#move('j')<CR>

" Autocommands
augroup WINDOWS
    autocmd!
    autocmd VimResized * wincmd =
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if exists("b:winview") && !&diff | call winrestview(b:winview) | endif
augroup END
