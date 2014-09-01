setup_vundle () {
	if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]
	then
		info 'Setting up Vundle'

		mkdir -p $HOME/.vim/bundle
		git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
		success 'Vundle installed'
	fi
}

setup_vundle
