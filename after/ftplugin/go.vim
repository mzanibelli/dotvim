" Ftplugin
if exists('b:loaded_local_ftplugin_go')
    finish
endif
let b:loaded_local_ftplugin_go = 1

" Compiler
compiler go

" Options
setlocal foldenable
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal noexpandtab
setlocal formatoptions=crqj
setlocal nofoldenable

" Mappings
nnoremap <buffer> <silent> <BS> :<C-U>call go#test()<CR>
nnoremap <buffer> <silent> <CR> :<C-U>!clear;go run %<CR>

" Variables
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1
let b:commentprefix = '//'
