" Ftplugin
if exists('b:loaded_local_ftplugin_gitcommit')
    finish
endif
let b:loaded_local_ftplugin_gitcommit = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -buffer -nargs=0 Abort execute "normal! ggdG:\<C-U>x\<CR>"

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
setlocal formatoptions=crqjtn
setlocal formatlistpat=^\\s*
setlocal formatlistpat+=[
setlocal formatlistpat+=\\[({]\\?
setlocal formatlistpat+=\\(
setlocal formatlistpat+=[0-9]\\+
setlocal formatlistpat+=\\\|[iIvVxXlLcCdDmM]\\+
setlocal formatlistpat+=\\\|[a-zA-Z]
setlocal formatlistpat+=\\)
setlocal formatlistpat+=[\\]:.)}
setlocal formatlistpat+=]
setlocal formatlistpat+=\\s\\+
setlocal formatlistpat+=\\\|^\\s*[-–+o*]\\s\\+

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
