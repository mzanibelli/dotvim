" Commands
command! -buffer -nargs=0 Minify call xml#minify()

" Mappings
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>

" Options
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
