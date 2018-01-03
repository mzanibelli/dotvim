" Plugin
if exists('g:loaded_local_plugin_ranger')
    finish
endif
let g:loaded_local_plugin_ranger = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>r :<C-U>call ranger#toggle()<CR>
nnoremap <silent> gh :<C-U>call ranger#open(expand("%:h"))<CR>

" Autocommands
augroup RANGER
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter * call ranger#auto(expand("<afile>"))
    autocmd BufEnter * filetype detect
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
