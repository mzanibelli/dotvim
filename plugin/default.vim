" Plugin
if exists('g:loaded_local_plugin_default')
    finish
endif
let g:loaded_local_plugin_default = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <S-S> :<C-U>update<CR>

" Autocommands
augroup DEFAULT
    autocmd!
    autocmd User SourceDetectPost if filereadable('.vimrc') | source .vimrc | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
