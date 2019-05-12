" Settings for spell checking.
set dictionary=/usr/share/dict/words
" Use local dict for words that shouldn't be found in version control.
set spellfile=~/.vim/custom-dictionary.utf-8.add,.vim-local-dictionary.utf-8.add
" Use capitals to modify local dict.
nnoremap zG 2zg
nnoremap zW 2zw
