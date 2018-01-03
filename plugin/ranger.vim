" Plugin
if exists('g:loaded_local_plugin_ranger')
    finish
endif
let g:loaded_local_plugin_ranger = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <Leader>r :<C-U>Ranger<Space>
nnoremap <silent> gh :<C-U>Ranger <C-R>=expand("%:h")<CR><CR>

" Commands
command! -nargs=? -complete=file Ranger call ranger#open(<f-args>)

" Autocommands
augroup RANGER
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter * call ranger#auto(expand("<afile>"))
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
