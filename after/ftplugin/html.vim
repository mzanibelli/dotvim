command! -buffer -range -nargs=0 Entities PreserveView call html#entities(<line1>, <line2>)
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
