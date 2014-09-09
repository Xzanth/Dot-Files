" Fold manualy, for easy folding of tags.
setlocal foldmethod=manual

" Use local leader f to fold the current tag.
nnoremap <buffer> <localleader>f Vatzf

" Use local leader t to fold the current templatetag.
nmap <buffer> <localleader>t viikojozf

" Indent tag
nnoremap <buffer> <localleader>= Vat=

" Django tags
inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

" Django variables
inoremap <buffer> <c-b> {{<space><space>}}<left><left><left>

