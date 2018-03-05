" Plugin
if exists('g:loaded_local_plugin_doc')
    finish
endif
let g:loaded_local_plugin_doc = 1

" Commands
command! -nargs=1 DevDocs silent! call system("$BROWSER 'https://devdocs.io?q=".&ft." ".<q-args>."'")
