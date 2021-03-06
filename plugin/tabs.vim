" Plugin
if exists('g:loaded_local_plugin_tabs')
    finish
endif
let g:loaded_local_plugin_tabs = 1

" Mappings
nnoremap <silent> gp :<C-U>tabnext<CR>
nnoremap <silent> gP :<C-U>tabprev<CR>
nnoremap <silent> <Leader>tt :<C-U>tabnew<CR>
nnoremap <silent> <Leader>to :<C-U>tabonly<CR>
nnoremap <silent> <Leader>tn :<C-U>tabnext<CR>
nnoremap <silent> <Leader>tp :<C-U>tabprev<CR>
nnoremap <silent> <Leader>tc :<C-U>tabclose<CR>
nnoremap <silent> <Leader>tl :<C-U>tabs<CR>
