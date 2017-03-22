" Plugin
if exists('g:loaded_local_fold')
  finish
endif
let g:loaded_local_fold = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <CR> :<C-U>call fold#toggle()<CR>
nnoremap <silent> <BS> :<C-U>call fold#toggleall()<CR>
nnoremap <silent> <Tab> :<C-U>call fold#next()<CR>
nnoremap <S-Tab> zk

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
