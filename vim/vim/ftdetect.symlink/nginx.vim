" Detect all files in nginx directories and vhost files as the nginx filetype.
au BufRead,BufNewFile /etc/nginx/conf/*				set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-available/*		set ft=nginx
au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/*	set ft=nginx
au BufRead,BufNewFile vhost.nginx				set ft=nginx

