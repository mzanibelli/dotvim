" Plugin
if exists('g:loaded_local_plugin_fzf')
    finish
endif
let g:loaded_local_plugin_fzf = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>f :<C-U>call fzf#find()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
