" Mark syntax errors with :signs.
let g:syntastic_enable_signs = 1
" Don't automatically jump to the error on save.
let g:syntastic_auto_jump = 0
" Show the error list automatically.
let g:syntastic_auto_loc_list=1
" Customize what the statusline shows.
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
" Use rubocop to check ruby
let g:syntastic_ruby_checkers = ['rubocop']

nnoremap <leader>C :SyntasticCheck<cr>
