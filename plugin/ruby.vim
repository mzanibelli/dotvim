" Plugin
if exists('g:loaded_local_ruby')
  finish
endif
let g:loaded_local_ruby = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:ruby_no_expensive=1
let g:ruby_operators=1
let g:ruby_space_errors=0
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
