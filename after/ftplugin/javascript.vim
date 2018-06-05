" Ftplugin
if exists('b:loaded_local_ftplugin_javascript')
    finish
endif
let b:loaded_local_ftplugin_javascript = 1

" Compiler
compiler javascript

" Mappings
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1
let b:ftsnippets = {"clog": "console.log(%)"}
let b:nodemodules = finddir('node_modules', fnamemodify(resolve(@%), ':p:h').';', -1)

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal suffixesadd=.js,.json
setlocal include=\\%(\\<require\\s*(\\s*\\\|\\<import\\>[^;\"']*\\)[\"']\\zs[^\"']*
setlocal includeexpr=javascript#includeexpr(v:fname,@%)
setlocal define=^\\s*const
setlocal matchpairs-=<:>
setlocal formatoptions=crqj

" Custom
if !empty(b:nodemodules)
    execute "setlocal" "path+=".join(b:nodemodules, ',')
endif
