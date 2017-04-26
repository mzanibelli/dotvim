" Plugin
if exists('g:loaded_local_plugin_misc')
    finish
endif
let g:loaded_local_plugin_misc = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap g; g;zvzz
nnoremap g, g,zvzz
noremap gj j
noremap gk k
noremap j gj
noremap k gk
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
