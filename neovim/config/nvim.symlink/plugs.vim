call plug#begin('~/.local/share/nvim/pluggedh')

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'		" Gutter with signs of whether text has been added, removed or changed.
Plug 'tpope/vim-fugitive'		" Wrapper for git.
Plug 'tpope/vim-git'			" Updated filetype and syntax settings for git related files.

Plug 'scrooloose/syntastic'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'sjl/gundo.vim'

Plug 'kien/ctrlp.vim'		    " Fuzzy search for files and buffers easily.
Plug 'mileszs/ack.vim'	    " Ack a code base.
Plug 'rking/ag.vim'		    " Ag a code base.
Plug 'nelstrom/vim-visual-star-search'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'		" Functions as text objects.
Plug 'lucapette/vim-textobj-underscore'	" Words separated with underscores.
Plug 'vim-scripts/argtextobj.vim'		" Arguments as text objects.

call plug#end()
