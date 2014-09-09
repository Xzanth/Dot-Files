" Detect .pgsql and .sql files as postgresql files.
au BufNewFile,BufRead *.sql set filetype=pgsql
au BufNewFile,BufRead *.pgsql set filetype=pgsql

