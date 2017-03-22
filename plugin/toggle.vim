" Plugin
if exists('g:loaded_local_plugin_toggle')
  finish
endif
let g:loaded_local_plugin_toggle = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
set pastetoggle=<F9>

" Mappings
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Autocommands
augroup TOGGLE
    autocmd!
    autocmd VimEnter * call toggle#map("<F5>", "ignorecase")
    autocmd VimEnter * call toggle#map("<F6>", "wrap")
    autocmd VimEnter * call toggle#map("<F7>", "list")
    autocmd VimEnter * call toggle#map("<F8>", "number")
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
