function! javascript#includeexpr(target, current) abort
    let l:modules = javascript#modules(a:current)
    let l:target = javascript#resolve(a:target, a:current)
    for dir in l:modules
        let l:index = javascript#index(l:target, dir)
        if l:index != v:false
            return l:index
        endif
    endfor
    return l:target
endfunction

function! javascript#modules(base)
    if !exists("b:nodemodules")
        let b:nodemodules = finddir('node_modules', fnamemodify(resolve(a:base), ':p:h').';', -1)
    endif
    return b:nodemodules
endfunction

function! javascript#resolve(path, base)
    return a:path =~# '^\.\.\=/' ? simplify(fnamemodify(resolve(a:base), ':p:h') . '/' . a:path) : a:path
endfunction

function! javascript#index(name, modules)
    let l:package = a:modules . '/' . a:name . '/package.json'
    try
        let l:content = json_decode(join(readfile(l:package)))
        return a:modules . '/' . a:name . '/' . substitute(get(l:content, 'main', 'index'), '\.js$', '', '')
    catch
        return v:false
    endtry
endfunction
