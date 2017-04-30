function! index#range(range)
    let l:output = ''
    redir => l:output
        silent! execute a:range . 's///en'
    redir END
    return str2nr(matchstr(l:output, '\d\+'))
endfunction

function! index#line()
    let l:line = line('.')
    let l:col = col('.')
    normal! 0
    let l:matches = 0
    let l:opt = 'c'
    while search(@/, l:opt, l:line) && col('.') <= l:col
        let l:matches += 1
        let l:opt = ''
    endwhile
    return l:matches
endfunction

function index#above(cached_values)
    if line('.') == 1
        return 0
    endif
    let [old_line, old_result, total] = a:cached_values
    let l:line = line('.')
    let l:top = l:line
    let l:old = abs(l:line - old_line)
    let l:bottom = line('$') - l:line
    let l:min = min([l:top, l:old, l:bottom])
    if l:min == l:top
        return index#range('1,.-1')
    elseif l:min == l:bottom
        return total - index#range(',$')
    elseif old_line < l:line
        return old_result + index#range(old_line . ',-1')
    elseif old_line > l:line
        return old_result - index#range(',' . (old_line - 1))
    endif
    return old_result
endfunction

function! index#print()
    let l:dir = v:searchforward ? '/' : '?'
    if line('$') > 10000
        let l:msg = '[MAX]'
    else
        let [current, total] = index#count()
        let l:msg = '[' . current . '/' . total . ']'
    endif
    echo l:msg
    normal! zv
endfunction

function! index#count()
    let l:view = winsaveview()
    let l:old_fold = &foldenable
    set nofoldenable
    let l:line = index#line()
    let l:cache = [b:changedtick, @/]
    if exists('b:indexcachekey') && b:indexcachekey ==# l:cache
        let l:before = index#above(b:indexcacheval)
        let l:total = b:indexcacheval[-1]
    else
        let l:before = (line('.') == 1 ? 0 : index#range('1,-1'))
        let l:total = l:before + index#range(',$')
    endif
    let b:indexcacheval = [line('.'), l:before, l:total]
    let b:indexcachekey = l:cache
    call winrestview(l:view)
    let &foldenable = l:old_fold
    return [l:before + l:line, l:total]
endfunction
