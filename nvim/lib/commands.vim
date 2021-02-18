" strip trailing whitespace from all files
augroup TRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
