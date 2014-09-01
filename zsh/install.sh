setup_prezto () {
	if [ ! -d "$HOME/.zprezto" ]
	then
		info 'Setting up Prezto'

		git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
		for rcfile in `find $HOME/.zprezto/runcoms/ -type f -not -name 'README.md'`
		do
			ln -sf "$rcfile" "$HOME/.${rcfile##*/}"
		done
		success 'Prezto installed'
	fi
}

setup_prezto
