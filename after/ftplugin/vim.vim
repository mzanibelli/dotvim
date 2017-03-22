" Ftplugin
if exists('b:loaded_local_ftplugin_vim')
    finish
endif
let b:loaded_local_ftplugin_vim = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>source %<CR>
nnoremap <buffer> <silent> K :<C-U>Help <C-R><C-W><CR>

" Options
setlocal foldenable
setlocal foldlevel=0
setlocal foldmethod=marker
setlocal foldnestmax=1

" Variables
let b:completiontype = "\<C-X>\<C-V>"
let b:commentprefix = '"'
let b:autoclose = ['quote', 'square']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
