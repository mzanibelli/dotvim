function! doc#browse(search)
    let l:search = substitute(a:search, ' ', '+', '')
    if &ft == "php"
        silent execute "!firefox https://php.net/manual-lookup.php?pattern=".l:search
    elseif &ft == "python"
        silent execute "!firefox https://docs.python.org/2.7/search.html?q=".l:search
    elseif &ft == "go"
        silent execute "!firefox https://golang.org/search?q=".l:search
    elseif &ft == "sh"
        silent execute "!firefox http://explainshell.com/explain?cmd=".l:search
    else
        silent execute "!firefox https://duckduckgo.com/?q=".&ft."+".l:search
    endif
    redraw!
endfunction
