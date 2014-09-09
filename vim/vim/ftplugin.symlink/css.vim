" Fold css files on braces
setlocal foldmethod=marker
setlocal foldmarker={,}
" Auto-complete css syntax.
setlocal omnifunc=csscomplete#CompleteCSS
" Dashes do not separate words, so id-name is no longer 3 words but one.
setlocal iskeyword+=-

" Use <leader>S to sort properties.  Turns this:
nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

