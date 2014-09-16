" Jump to tags.

function! JumpToTag()
	execute "normal! \<c-]>mzzMzvzz15\<c-e>"
	execute "keepjumps normal! `z"
	Pulse
endfunction
function! JumpToTagInSplit()
	execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
	execute "keepjumps normal! `z"
	Pulse
endfunction

" Jump to tag in same window.
nnoremap <c-]> :silent! call JumpToTag()<cr>
" Jump to tag in new vertical split.
nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>
