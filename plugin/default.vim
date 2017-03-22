" Plugin
if exists('g:loaded_local_plugin_default')
  finish
endif
let g:loaded_local_plugin_default = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup DEFAULT
    autocmd!
    autocmd User SourceDetectPost call default#init()
augroup END

" Mappings
nnoremap <S-S> :<C-U>w<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
