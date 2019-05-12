call plug#begin('~/.local/share/nvim/pluggedh')

" Change surroundings cs
Plug 'tpope/vim-surround'

" Airline
Plug 'vim-airline/vim-airline'

" Latex
Plug 'lervag/vimtex'

" Gutter with signs of whether text has been added, removed or changed.
Plug 'airblade/vim-gitgutter'
" Wrapper for git.
Plug 'tpope/vim-fugitive'
" Updated filetype and syntax settings for git related files.
Plug 'tpope/vim-git'

" Syntax Checker
Plug 'scrooloose/syntastic'

" Required by other plugins
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

" Undo window
Plug 'sjl/gundo.vim'

" Fuzzy search for files and buffers easily.
Plug 'kien/ctrlp.vim'
" Search codebase
Plug 'mileszs/ack.vim'
" Search for word under cursor
Plug 'nelstrom/vim-visual-star-search'

" Required for textobj plugins
Plug 'kana/vim-textobj-user'
" Functions as text objects.
Plug 'kana/vim-textobj-function'
" Words separated with underscores.
Plug 'lucapette/vim-textobj-underscore'
" Arguments as text objects.
Plug 'vim-scripts/argtextobj.vim'

" Snippets
Plug 'SirVer/ultisnips'

call plug#end()
