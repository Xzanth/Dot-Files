" Settings that alter the appearance of vim.

" Cursorline {{{
" Only show the cursorline in the current window in normal mode

augroup cline
	au!
	au WinLeave,InsertEnter * set nocursorline
	au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" Trailing whitespace {{{
" Only show when not in insert mode.

augroup trailing
	au!
	au InsertEnter * :set listchars-=trail:·
	au InsertLeave * :set listchars+=trail:·
augroup END

" }}}

