" Commands
command! -nargs=* Find call find#find(<q-args>)

" Mappings
nnoremap <Leader>e :<C-U>Find<Space>
nnoremap <Leader>m :<C-U>browse oldfiles<CR>
