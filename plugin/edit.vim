" Plugin
if exists('g:loaded_local_plugin_edit')
    finish
endif
let g:loaded_local_plugin_edit = 1

" Mappings
nnoremap <silent> <Leader>e :<C-U>call edit#open('fzf', getcwd())<CR>
nnoremap <silent> <Leader>n :<C-U>call edit#open('nnn', getcwd())<CR>
nnoremap <silent> gh :<C-U>call edit#open('nnn', expand("%:h"))<CR>
