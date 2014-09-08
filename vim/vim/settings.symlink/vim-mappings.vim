" Remappings I have made

" Check if any buffers were edited outside of vim
noremap <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Create empty lines
nnoremap <silent><leader>o :set paste<cr>mzo<Esc>`z:set nopaste<cr>
nnoremap <silent><leader>O :set paste<cr>mzO<Esc>`z:set nopaste<cr>

" Tabs
nnoremap <C-Tab> :tabnext<cr>
nnoremap <C-S-Tab> :tabprev<cr>

" Windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>q :q<cr>

" Copy to X
function! g:CopyToX() " {{{
	let old_z = @z
	normal! gv"zy
	call system('xsel -i', @z)
	let @z = old_z
endfunction " }}}

noremap <leader>p :silent! set paste<cr>"*p:set nopaste<cr>
nnoremap <leader>y viw:<c-u>call g:CopyToX()<cr>
vnoremap <leader>y :<c-u>call g:CopyToX()<cr>

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !myctags >/dev/null 2>&1 &<cr>:redraw!<cr>

" Find out what leads to the syntax colours for what the cursor is on.
" TODO Really?
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Remove trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Send visual selection to paste.xzanth.com
" TODO

" Select entire buffer.
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Transpose last word to uppercase.
inoremap <C-u> <esc>mzgUiw`za

" Zoom to head level.
nnoremap zh mzzt10<c-u>`z

" Linewise selection of what you just pasted.
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph
nnoremap <leader>J mzvipJ`z

" Split line
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a

" Open a quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/ %'<cr>:copen<cr>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<cr>

" Select the entire line charwise
nnoremap vv ^vg_

" use w!! when forgotten to sudo
cnoremap w!! w !sudo tee % >/dev/null

" Toggle paste
nnoremap <F6> :set paste!<cr>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Source
" For testing quick changes to vimrc
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourcedline.'<cr>

" Zip Right
" Say we had info and we wanted that to be passed to a function just put it at
" the beggining function()info and use zl to zip the ) char to the end.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Use very magic searching most symbols have a specific meaning.
nnoremap / /\v
vnoremap / /\v

" Clear highlighted matches.
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Do the same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Go down visible lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

