" Ftplugin
if exists('b:loaded_local_ftplugin_gitcommit')
    finish
endif
let b:loaded_local_ftplugin_gitcommit = 1

" Mappings
nnoremap <buffer> <silent> <C-N> :<C-U>call search('^@@')<CR>
nnoremap <buffer> <silent> <C-P> :<C-U>call search('^@@', 'b')<CR>

" Variables
let b:norestore = 1
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']

" Options
setlocal comments+=fb:-
setlocal nonumber
setlocal textwidth=60
setlocal spell
setlocal nobuflisted
setlocal formatoptions=crqjtnl
