" Commands
command! -nargs=* -complete=command PreserveView call windows#preserve(<q-args>)

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
augroup END
