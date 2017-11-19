if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1

setlocal comments=s1:/*,mb:*,ex:*/,s0:/*,mb:\ ,ex:*/,:///,://!,://
setlocal commentstring=//%s
setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
setlocal textwidth=99
