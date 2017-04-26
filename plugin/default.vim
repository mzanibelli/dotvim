" Plugin
if exists('g:loaded_local_plugin_default')
    finish
endif
let g:loaded_local_plugin_default = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <Leader>w :<C-U>update<CR>
nnoremap <Leader>q :<C-U>quitall<CR>
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Autocommands
augroup DEFAULT
    autocmd!
    autocmd User SourceDetectPost if filereadable('.vimrc') | source .vimrc | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
