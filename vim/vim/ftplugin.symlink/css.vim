setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal omnifunc=csscomplete#CompleteCSS
setlocal iskeyword+=-

" Use <leader>S to sort properties.  Turns this:
"
"	  p {
"		  width: 200px;
"		  height: 100px;
"		  background: red;
"
"		  ...
"	  }
"
" into this:

"	  p {
"		  background: red;
"		  height: 100px;
"		  width: 200px;
"
"		  ...
"	  }
nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Make <cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
