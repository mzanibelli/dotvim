" Commands
command! -buffer -range -nargs=0 Entities PreserveView call html#entities(<line1>, <line2>)

" Mappings
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>

" Variables
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
