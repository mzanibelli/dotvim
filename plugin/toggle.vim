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

" Init
call toggle#map("<F5>", "ignorecase")
call toggle#map("<F6>", "wrap")
call toggle#map("<F7>", "list")
call toggle#map("<F8>", "number")

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
