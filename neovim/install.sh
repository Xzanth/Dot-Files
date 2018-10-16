setup_vim_plug () {
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then setup_vim_plug; fi
