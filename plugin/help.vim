" Plugin
if exists('g:loaded_local_plugin_help')
  finish
endif
let g:loaded_local_plugin_help = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* -complete=help Help call help#help(<q-args>)

" Autocommands
augroup HELP
    autocmd!
    autocmd FileType help only
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
