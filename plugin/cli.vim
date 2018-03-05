" Plugin
if exists('g:loaded_local_plugin_cli')
    finish
endif
let g:loaded_local_plugin_cli = 1

" Mappings
cnoremap <CR> <C-]><CR>
cnoremap <expr> <C-Y> wildmenumode() ? "\<C-]>" : "\<C-Y>"

" Autocommands
augroup CLI
    autocmd!
    autocmd CmdwinEnter * nnoremap <CR> <CR>
augroup END
