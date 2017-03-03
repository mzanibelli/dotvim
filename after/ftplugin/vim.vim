" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>source %<CR>
nnoremap <buffer> <silent> K :<C-U>Help <C-R><C-W><CR>

" Options
setlocal foldenable
setlocal foldlevel=0
setlocal foldmethod=marker
setlocal foldnestmax=1

" Variables
let b:completiontype="\<C-X>\<C-V>"
let b:commentprefix='"'
