" Plugin
if exists('g:loaded_local_plugin_sudo')
    finish
endif
let g:loaded_local_plugin_sudo = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 SudoWrite call sudo#write()
command! -nargs=0 SudoEdit call sudo#edit()

" Mappings
nnoremap <silent> <Leader>$ :<C-U>call sudo#edit()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
