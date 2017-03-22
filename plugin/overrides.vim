" Plugin
if exists('g:loaded_local_plugin_overrides')
  finish
endif
let g:loaded_local_plugin_overrides = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Init
call cli#override("grep", "Grep")
call cli#override("h", "Help")
call cli#override("help", "Help")
call cli#override("make", "Make")
call cli#override("find", "Find")
call cli#override("tag", "Tag")
call cli#override("w!!", "w !sudo tee % >/dev/null")
call cli#override("w$", "w")
call cli#override("w<", "w")
call cli#override("qw", "wq")

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
