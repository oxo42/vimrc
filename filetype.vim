au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 
au BufRead,BufNewFile /etc/syslog-ng/*.conf if &ft == '' | setfiletype syslog-ng | endif 
au BufRead,BufNewFile /etc/logrotate.d/* if &ft == '' | setfiletype logrotate | endif 
