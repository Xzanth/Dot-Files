" Use leader ag to ag this directory.
nnoremap <leader>ag :Ack! ""<left>
" Use leader af to ag for files.
nnoremap <leader>af :AckFile! ""<left>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
