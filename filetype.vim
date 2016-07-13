au BufRead,BufNewFile /etc/nginx/*.conf,/usr/local/nginx/conf/*.conf if &ft == '' | setfiletype nginx | endif 
au BufRead,BufNewFile /etc/syslog-ng/*.conf if &ft == '' | setfiletype syslog-ng | endif 
au BufRead,BufNewFile /etc/logrotate.d/* if &ft == '' | setfiletype logrotate | endif 
au BufRead,BufNewFile *.expect if &ft == '' | setfiletype expect | endif 
au BufRead,BufNewFile Jenkinsfile if &ft == '' | setfiletype groovy | endif 
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ match BadWhitespace /\s\+$/
