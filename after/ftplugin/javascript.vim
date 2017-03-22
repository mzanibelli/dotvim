" Init
call default#snippet("clog", "console.log(%);")

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker

" Variables
let b:commentprefix='//'
let b:autoclose = ['curly', 'square', 'quote']
let b:autocompile=1
