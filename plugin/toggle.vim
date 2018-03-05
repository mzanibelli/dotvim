" Plugin
if exists('g:loaded_local_plugin_toggle')
    finish
endif
let g:loaded_local_plugin_toggle = 1

" Options
set pastetoggle=<F9>

" Mappings
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Autocommands
augroup TOGGLE
    autocmd!
    autocmd User DeferPost call toggle#map("<F5>", "ignorecase")
    autocmd User DeferPost call toggle#map("<F6>", "wrap")
    autocmd User DeferPost call toggle#map("<F7>", "list")
    autocmd User DeferPost call toggle#map("<F8>", "number")
augroup END
