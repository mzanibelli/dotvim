" Plugin
if exists('g:loaded_local_plugin_spell')
    finish
endif
let g:loaded_local_plugin_spell = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>z :<C-U>call spell#correct()<CR>
inoremap <silent> <C-Z> <C-O>:<C-U>call spell#correct()<CR>
nnoremap <silent> <Leader>& :<C-U>call spell#switch()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
