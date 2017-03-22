" Plugin
if exists('g:loaded_local_netrw')
  finish
endif
let g:loaded_local_netrw = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_alto=1
let g:netrw_silent=1
let g:netrw_use_errorwindow=0
let g:netrw_browse_split=0
let g:netrw_browsex_viewer= "xdg-open"
let g:netrw_ftp_cmd="ftp -p"

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
