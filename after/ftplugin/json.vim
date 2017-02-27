" Commands
command! -buffer -nargs=0 Minify call json#minify()

" Options
setlocal conceallevel=0
setlocal formatprg=python\ -m\ json.tool
