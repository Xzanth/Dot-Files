" TODO MAKE THIS WORK AND UNDERSTAND IT WHEN I ACTUALLY EVER DECIDE TO USE LISP
function! SetLispWords() " {{{
	if exists("g:did_set_lisp_words")
		return
	endif

	let g:did_set_lisp_words = 1

	set lispwords+=switch
	set lispwords+=cswitch
	set lispwords+=eswitch
endfunction " }}}

call SetLispWords()

" Set up some basic tslime mappings until I shave the fuckin
" Fireplace/Common Lisp yak.
"
" key  desc			  mnemonic
" \t - connect tslime		  [t]slime
" \f - send current form	  [f]orm
" \e - send top-level form	  [e]val
" \r - send entire file		  [r]eload file
" \c - send ctrl-l		  [c]lear

function! SendToTmuxStripped(text)
	  call SendToTmux(substitute(a:text, '\v\n*$', '', ''))
endfunction

" Send the current form to the REPL
nnoremap <buffer> <silent> <localleader>f :let lisp_tslime_view = winsaveview()<cr>vab"ry:call SendToTmuxStripped(@r)<cr>:call winrestview(lisp_tslime_view)<cr>

" Send the current top-level form to the REPL
nnoremap <buffer> <silent> <localleader>e :let lisp_tslime_view = winsaveview()<cr>:silent! normal! l<cr>:call PareditFindDefunBck()<cr>vab"ry:call SendToTmuxStripped(@r)<cr>:call winrestview(lisp_tslime_view)<cr>

" Send the entire buffer to the REPL
nnoremap <buffer> <silent> <localleader>r :let lisp_tslime_view = winsaveview()<cr>ggVG"ry:call SendToTmuxStripped(@r)<cr>:call winrestview(lisp_tslime_view)<cr>

" Clear the REPL
nnoremap <buffer> <silent> <localleader>c :call SendToTmuxRaw("")<cr>

RainbowParenthesesActivate
RainbowParenthesesLoadRound
RainbowParenthesesLoadSquare
RainbowParenthesesLoadBraces

silent! call TurnOnLispFolding()

noremap <buffer> () :<c-u>call PareditWrap("(", ")")<cr>
noremap <buffer> )( :<c-u>call PareditSplice()<cr>
noremap <buffer> (( :<c-u>call PareditMoveLeft()<cr>
noremap <buffer> )) :<c-u>call PareditMoveRight()<cr>
noremap <buffer> (j :<c-u>call PareditJoin()<cr>
noremap <buffer> (s :<c-u>call PareditSplit()<cr>
noremap <buffer> )j :<c-u>call PareditJoin()<cr>
noremap <buffer> )s :<c-u>call PareditSplit()<cr>
noremap <buffer> [[ :<c-u>call PareditSmartJumpOpening(0)<cr>
noremap <buffer> ]] :<c-u>call PareditSmartJumpClosing(0)<cr>

" Indent top-level form.
nmap <buffer> <localleader>= mz99[(v%='z

