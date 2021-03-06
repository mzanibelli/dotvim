" Plugin
if exists('g:loaded_local_plugin_yank')
    finish
endif
let g:loaded_local_plugin_yank = 1

" Mappings
nnoremap <silent> <expr> YY yank#incmap("line")
nnoremap <silent> <expr> Y yank#incmap("operator")
vnoremap <silent> <expr> Y yank#incmap("visual")
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>Y "+Y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

" Autocommands
augroup YANK
    autocmd!
    autocmd InsertLeave * set nopaste
augroup END
