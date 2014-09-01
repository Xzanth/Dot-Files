setup_vundle () {
	info 'Setting up Vundle'

	mkdir -p $HOME/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	success 'Vundle installed'
}

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then setup_vundle; fi

if [ ! -d "$HOME/.vim/colors" ]; then mkdir -p "$HOME/.vim/colors"; fi
link_file "$DOTFILES_ROOT/vim/molokai.vim" "$HOME/.vim/colors/molokai.vim"
