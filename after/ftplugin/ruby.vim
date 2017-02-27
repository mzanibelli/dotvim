compiler ruby
let g:ruby_no_expensive=1
let g:ruby_operators=1
let g:ruby_space_errors=0
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('ruby %')<CR>
