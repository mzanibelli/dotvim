" Plugin
if exists('g:loaded_local_plugin_marks')
    finish
endif
let g:loaded_local_plugin_marks = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup MARKS
    autocmd!
    autocmd BufLeave * if exists("b:filemark") | execute "normal! m".b:filemark | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
