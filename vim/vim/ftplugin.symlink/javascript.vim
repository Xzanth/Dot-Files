setlocal foldmethod=marker
setlocal foldmarker={,}

" Type clog to easily write a console log call.
call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')


" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

" Prettify a hunk of JSON with <localleader>p
nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
