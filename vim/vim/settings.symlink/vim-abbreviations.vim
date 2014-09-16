" Remove a char.
function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

" A function to create abbreviations which deletes the space after.
function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction
" A buffer local version for filetype plugins.
function! MakeSpacelessBufferIabbrev(from, to)
    execute "iabbrev <silent> <buffer> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

" Common unicode symbols.
call MakeSpacelessIabbrev('utfdeg',  '°')
call MakeSpacelessIabbrev('utfpi',  'π')
call MakeSpacelessIabbrev('utfuneq',  '≠')
call MakeSpacelessIabbrev('utfapprox',  '≈')
