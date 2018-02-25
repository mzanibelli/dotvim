function! php#funcregex()
    return '\(.*\%#\)\@!\_^\s*\zs\(\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\)'
endfunction

function! php#functions()
    silent execute "vimgrep /".php#funcregex()."/ %"
endfunction

function! php#includeexpr(file)
    let l:file = substitute(a:file, '\\', '/', 'g')
    return substitute(l:file, '^/', '', '')
endfunction

function! php#cs()
    if executable("php-cs-fixer")
        let l:command = printf("php-cs-fixer --quiet --no-interaction fix --using-cache=no %s", shellescape(expand("%:p")))
        call system(l:command)
        silent! checktime
    endif
endfunction
