" Plugin
if exists('g:loaded_local_find')
  finish
endif
let g:loaded_local_find = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* Find call find#find(<q-args>)

" Mappings
nnoremap <Leader>e :<C-U>Find<Space>
nnoremap <Leader>m :<C-U>browse oldfiles<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
