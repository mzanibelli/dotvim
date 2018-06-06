function! async#start(command, callback)
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = {}
    if a:callback != v:false
        let l:options["out_cb"] = a:callback
    endif
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call job_start(l:command, l:options)
endfunction
