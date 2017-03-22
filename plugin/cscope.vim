" Plugin
if exists('g:loaded_local_cscope')
  finish
endif
let g:loaded_local_cscope = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=1 Scope call cscope#go(<q-args>)

" Mappings
nnoremap <Leader>th :<C-U>call cscope#menu()<CR>:Scope<Space>
for char in [ "c", "d", "g", "s", "t", "e", "i", "a", "f"]
    execute 'nnoremap <Leader>t'.char.' :<C-U>call cscope#go("'.char.'")<CR>'
endfor

" Autocommands
augroup CSCOPE
    autocmd!
    autocmd User SourceDetectPost call cscope#init()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
