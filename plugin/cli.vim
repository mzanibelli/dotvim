" Plugin
if exists('g:loaded_local_plugin_cli')
    finish
endif
let g:loaded_local_plugin_cli = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
cnoremap <CR> <C-]><CR>
cnoremap <expr> <C-Y> wildmenumode() ? "\<C-]>" : "\<C-Y>"

" Commands
command! -nargs=* Git <mods> terminal ++close git <args>

" Autocommands
augroup CLI
    autocmd!
    autocmd CmdwinEnter * nnoremap <CR> <CR>
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
