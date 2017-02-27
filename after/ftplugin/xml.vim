command! -buffer -nargs=0 Minify call xml#minify()
inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
