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
