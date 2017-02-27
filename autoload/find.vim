function! find#find(filename)
    silent call qf#cclear()
    if a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call qf#cload("call find#find2qf('".a:filename."')")
        call qf#cfirst(1)
    endif
endfunction

function! find#find2qf(filename)
  let l:results = tempname()
  let l:filename = shellescape(printf("*%s*", a:filename))
  execute '!find . -type f -ipath '.l:filename.' -not -path "*/\.*" 2>/dev/null > '.l:results
  let l:old_errfmt = &errorformat
  set errorformat=%f
  execute "cgetfile ".l:results
  call delete(l:results)
  let &errorformat = l:old_errfmt
endfunction
