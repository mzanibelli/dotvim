function! doc#browse(search)
    let l:search = substitute(a:search, ' ', '+', '')
    if &ft == "php"
        silent execute "!surf https://php.net/manual-lookup.php?pattern=".l:search
    elseif &ft == "python"
        silent execute "!surf https://docs.python.org/2.7/search.html?q=".l:search
    elseif &ft == "go"
        silent execute "!surf https://golang.org/search?q=".l:search
    elseif &ft == "sh"
        silent execute "!surf http://explainshell.com/explain?cmd=".l:search
    else
        silent execute "!surf https://duckduckgo.com/?q=".&ft."+".l:search
    endif
    redraw!
endfunction
