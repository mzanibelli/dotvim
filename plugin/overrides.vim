" Plugin
if exists('g:loaded_local_plugin_overrides')
  finish
endif
let g:loaded_local_plugin_overrides = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup TOGGLE
    autocmd!
    autocmd VimEnter * call cli#override("h", "Help")
    autocmd VimEnter * call cli#override("help", "Help")
    autocmd VimEnter * call cli#override("make", "Make")
    autocmd VimEnter * call cli#override("find", "Find")
    autocmd VimEnter * call cli#override("tag", "Tag")
    autocmd VimEnter * call cli#override("grep", "Grep")
    autocmd VimEnter * call cli#override("w!!", "w !sudo tee % >/dev/null")
    autocmd VimEnter * call cli#override("w$", "w")
    autocmd VimEnter * call cli#override("w<", "w")
    autocmd VimEnter * call cli#override("qw", "wq")
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
