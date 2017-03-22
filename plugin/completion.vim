" Plugin
if exists('g:loaded_local_completion')
  finish
endif
let g:loaded_local_completion = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
inoremap <silent> <expr> <Tab> completion#complete(0)
inoremap <silent> <expr> <S-Tab> completion#complete(1)
inoremap <C-T> <Tab>

" Autocommands
augroup COMPLETION
    autocmd!
    autocmd CompleteDone * call completion#undouble()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
