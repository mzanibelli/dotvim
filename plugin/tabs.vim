" Plugin
if exists('g:loaded_local_plugin_tabs')
    finish
endif
let g:loaded_local_plugin_tabs = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>tt :<C-U>tabnew<CR>
nnoremap <silent> <Leader>to :<C-U>tabonly<CR>
nnoremap <silent> <Leader>tn :<C-U>tabnext<CR>
nnoremap <silent> <Leader>tp :<C-U>tabprev<CR>
nnoremap <silent> <Leader>tc :<C-U>tabclose<CR>
nnoremap <silent> <Leader>tl :<C-U>tabs<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
