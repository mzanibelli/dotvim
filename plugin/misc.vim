" Plugin
if exists('g:loaded_local_plugin_misc')
    finish
endif
let g:loaded_local_plugin_misc = 1

" Mappings
nnoremap g; g;zv
nnoremap g, g,zv
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
