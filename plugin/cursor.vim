" Init
if &term ==# "linux"
    let &t_ve = substitute(&t_ve, '\e[?\zs0c', '6;14;224c', 'g')
endif
