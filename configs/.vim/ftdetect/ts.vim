autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
