function! async#start(command, ...)
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call extend(l:options, get(a:000, 0, {}))
    call job_start(l:command, l:options)
endfunction
