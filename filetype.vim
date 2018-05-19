au BufRead,BufNewFile /etc/nginx/*.conf,/usr/local/nginx/conf/*.conf if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile /etc/syslog-ng/*.conf if &ft == '' | setfiletype syslog-ng | endif
au BufRead,BufNewFile /etc/logrotate.d/* if &ft == '' | setfiletype logrotate | endif
au BufRead,BufNewFile *.expect if &ft == '' | setfiletype expect | endif
au BufRead,BufNewFile Jenkinsfile if &ft == '' | setfiletype groovy | endif
au BufRead,BufNewFile TARGETS,*.cconf,*.cinc,*.tw if &ft == '' | setfiletype python | endif
au BufRead,BufNewFile .arcconfig,*.materialized_JSON if &ft == '' | setfiletype javascript | endif
